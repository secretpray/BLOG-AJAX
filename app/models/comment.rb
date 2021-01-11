class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post

  validates :body, presence: true  # No message error if blank  dd ', allow_blank: false'

  scope :by_user, -> { order(user_id: :asc) }
  scope :latest, -> { reorder(created_at: :desc)}
  scope :posted_today, -> { where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }
end
