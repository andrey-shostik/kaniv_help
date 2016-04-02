class CreateTenders < ActiveRecord::Migration
  def change
    create_table :tenders do |t|
      t.references :post, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :surname
      t.string :experience

      t.timestamps null: false
    end
  end
end
