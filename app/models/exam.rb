class Exam < ActiveRecord::Base
  HEADERS = ["user_id", "name", "id_no", "gender", "address", "age", "card_no", "cell", "chronic_diseases", "created_at"]
  belongs_to :user
  validates :user_id, presence: true
  validates :id_no, presence: true
  validates :name, presence: true
  validates :cell, presence: true
end
