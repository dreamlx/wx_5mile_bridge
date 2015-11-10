class Hospital < ActiveRecord::Base
  STATES = ["保存", "发布"]
  HEADERS = ["title", "img", "content", "video_url", "state", "created_at", "updated_at"]
  validates :state, inclusion: STATES
  mount_uploader :img, ImageUploader
end
