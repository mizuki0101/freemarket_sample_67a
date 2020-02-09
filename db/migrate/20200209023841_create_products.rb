class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.string :size
      t.string :bland
      t.text :description, null: false
      t.integer :price, null: false
      t.integer :prefecture_id, null: false
      t.references :categories, null: false, foreign_key: true
      t.references :saler, null: false
      t.references :buyer
      t.timestamps
    end
  end
end