class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  after_save :update_post_counter
  after_destroy :destroy_post_counter

  private

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def destroy_post_counter
    user.decrement!(:posts_counter)
  end
end
