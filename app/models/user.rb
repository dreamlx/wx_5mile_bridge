class User < ActiveRecord::Base
  HEADERS = ["cell", "name", "address", "gender", "id_no", "card_no", "doctor_id", "created_at", "updated_at"]
  GENDERS = ["男", "女"]
  belongs_to :doctor

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :name, presence: true
  validates :cell, presence: true
  validates :id_no, presence: true
  validates :gender, inclusion: GENDERS, allow_nil: true
end
