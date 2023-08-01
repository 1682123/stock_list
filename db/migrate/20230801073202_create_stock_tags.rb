class CreateStockTags < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_tags do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
