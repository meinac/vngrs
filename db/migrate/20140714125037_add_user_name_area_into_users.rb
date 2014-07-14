class AddUserNameAreaIntoUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string, limit: 50
    add_index :users, :user_name, unique: true
  end
end
