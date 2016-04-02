class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :surname
      t.string :password_digest
      t.string :token
      t.integer :money
      t.integer :user_key

      t.timestamps null: false
    end
  end
end
