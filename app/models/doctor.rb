class Doctor < ActiveRecord::Base
  HEADERS = ["id", "avatar", "username", "name", "grade", "desc", "hospital", "department", "state"]
  STATES = ["正常", "停诊"]
  GRADES = []
  HOSPITALS = []
  DEPARTMENTS = []
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :grade, presence: true
  validates :avatar, presence: true
  validates :desc, presence: true
  validates :hospital, presence: true
  validates :department, presence: true
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :state, presence: true, inclusion: STATES

  has_many :appointments, dependent: :destroy

  mount_uploader :avatar, ImageUploader
end
