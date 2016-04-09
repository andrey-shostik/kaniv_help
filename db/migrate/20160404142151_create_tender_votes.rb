class CreateTenderVotes < ActiveRecord::Migration
  def change
    create_table :tender_votes do |t|
      t.integer :tender_id
      t.integer :user_id
      t.integer :money
      t.string :name

      t.timestamps null: false
    end
  end
end
