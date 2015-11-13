class Shift < ActiveRecord::Base
  HEADERS = ["doctor_id", "date", "from_time", "to_time", "category", "shift_type"]
  belongs_to :doctor
  validates :doctor_id, presence: true
  validates :date, presence: true
  validates :from_time, presence: true
  validates :to_time, presence: true
end
