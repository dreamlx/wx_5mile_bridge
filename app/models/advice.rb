class Advice < ActiveRecord::Base
  STATES = ["保存", "发布"]
  ADVICE_TYPES = ["慢性病管理", "儿保", "妇保", "计划免疫"]
  HEADERS = ["title", "img", "content", "video_url", "advice_type", "state", "created_at", "updated_at"]
  validates :state, inclusion: STATES
  validates :advice_type, inclusion: ADVICE_TYPES
  mount_uploader :img, ImageUploader
end
