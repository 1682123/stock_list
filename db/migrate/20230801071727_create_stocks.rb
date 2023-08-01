class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :food_name, null: false
      t.date :expration_date, null: false
      t.string :memo
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
