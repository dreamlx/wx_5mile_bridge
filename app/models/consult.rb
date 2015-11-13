class Consult < ActiveRecord::Base
  DEPARTMENTS = ['妇女保健', '儿童保健', '计划免疫']
  STATES = ['已提交', '已回复']
  HEADERS = ["user_id", "title", "department", "content", "submit_at", "state"]
  belongs_to :user
  after_create :set_submit_at

  validates :department, inclusion: DEPARTMENTS

  private
    def set_submit_at
      update(submit_at: created_at)
    end
end
