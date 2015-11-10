class Consult < ActiveRecord::Base
  DEPARTMENTS = []
  STATES = []
  HEADERS = ["user_id", "title", "department", "content", "submit_at", "state"]
  belongs_to :user
  after_create :set_submit_at

  private
    def set_submit_at
      update(submit_at: created_at)
    end
end
