# frozen_string_literal: true

# Post to Likes
class AddPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, null: false, foreign_key: true
  end
end
