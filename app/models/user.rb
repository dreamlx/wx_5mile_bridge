class User < ActiveRecord::Base
  attr_accessor :reset_token
  HEADERS = ["cell", "name", "address", "gender", "id_no", "card_no", "doctor_id", "created_at", "updated_at"]
  GENDERS = ["男", "女"]
  belongs_to :doctor

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :name, presence: true
  validates :cell, presence: true
  validates :id_no, presence: true
  validates :gender, inclusion: GENDERS, allow_nil: true

  has_many :consults, dependent: :destroy
  has_many :appointments, dependent: :destroy

  before_create :generate_authentication_token

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break if !User.find_by(authentication_token: authentication_token)
    end
  end

  def reset_auth_token!
    generate_authentication_token
    save
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def create_reset_digest
    update(reset_digest: User.digest(reset_token))
    update(reset_sent_at: DateTime.now)
    reset_auth_token!
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
