class Post < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, :content, presence: true # length: { is: 5 }

  # scope :by_user_comments, -> { where(id: User.first.comments.map(&:post_id).uniq).pluck('title') }
  scope :by_user, -> { order(user_id: :asc) }
  scope :ordered, -> { reorder(created_at: :desc)}
  scope :posted_today, -> { where(created_at: Date.today.all_day) }
end
