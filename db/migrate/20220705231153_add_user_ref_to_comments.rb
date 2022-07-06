# frozen_string_literal: true

# Add user ref to comments
class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, foreign_key: { to_table: :users }, null: false
  end
end
