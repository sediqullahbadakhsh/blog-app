class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user, foreign_key: :author_id, optional: true
  belongs_to :author, class_name: 'User', optional: true
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    user.increment!(:posts_counter)
  end
end
