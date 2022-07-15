class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post

  after_save :update_comments_counter_for_post

  private

  def update_comments_counter_for_post
    post.increment!(:comments_counter)
  end
end
