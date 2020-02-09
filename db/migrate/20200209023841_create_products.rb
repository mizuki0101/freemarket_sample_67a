class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.string :size, null: false
      t.string :bland_id
      t.text :description, null: false
      t.integer :price
      t.integer :prefecture_id, null: false
      t.references :delivery_date, null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :saler_id, null: false, foreign_key: true
      t.references :buyer_id, foreign_key: true
      t.timestamps
    end
  end
end