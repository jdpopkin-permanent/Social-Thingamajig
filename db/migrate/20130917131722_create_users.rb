class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :session_token
      t.string :password_digest

      t.timestamps
    end

    add_index :users, :session_token
    add_index :users, :password_digest
  end
end
