class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false, unique: true
      t.string :password_digest, null: false
      t.string :session_token, null: false, unique: true
      t.string :email, unique: true
      t.timestamps  
    end
    add_index :users, :user_name
    add_index :users, :session_token
    add_index :users, :email
    add_index :users, [:user_name, :email]
  end
end
