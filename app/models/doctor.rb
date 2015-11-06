class Doctor < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  HEADERS = ["id", "avatar", "username", "name", "grade", "desc", "hospital", "department", "state"]

  mount_uploader :avatar, ImageUploader
end
