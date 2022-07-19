class AddConfirmableAndLockableToUsers < ActiveRecord::Migration[7.0]
  def change
    # Confirmable
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :confirmation_token, :string
    


  end
end
