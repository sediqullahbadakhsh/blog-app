class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter_for_post
  after_save :delete_comments_counter_for_post

  private

  def update_comments_counter_for_post
    post.increment!(:comments_counter)
  end
  def delete_comments_counter_for_post
    post.decrement!(:comments_counter)
  end
end
