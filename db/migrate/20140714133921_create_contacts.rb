class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|

      t.string :name, limit: 100
      t.string :last_name, limit: 100
      t.string :phone, limit: 20
      t.string :email, limit: 100
      t.integer :user_id

      t.timestamps
    end

    add_index :contacts, :user_id
    add_index :contacts, :phone
    add_index :contacts, :email
  end
end
