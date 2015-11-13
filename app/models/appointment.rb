class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor

  validates :user_id, presence: true
  validates :doctor_id, presence: true
  HEADERS = ['user_id', 'doctor_id', 'booking_time', 'cell', 'state']
  STATES = []
end
