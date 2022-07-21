class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter_for_post
  after_destroy :destroy_comments_counter_for_post

  private

  def update_comments_counter_for_post
    post.increment!(:comments_counter)
  end
  def destroy_comments_counter_for_post
    post.decrement!(:comments_counter)
  end
end
