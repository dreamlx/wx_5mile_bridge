class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor

  validates :user_id, presence: true
  validates :doctor_id, presence: true
  HEADERS = ['user_id', 'doctor_id', 'booking_time', 'cell', 'state']
  STATES = ["提交成功", "预约成功"]
  after_create :set_state

  private
    def set_state
      update(state: '提交成功') if state.nil?
    end
end
