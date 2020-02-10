class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,          null: false, index: true
      t.string :size        
      t.string :bland        
      t.integer :price,       null: false
      t.text :description,        null: false
      t.integer :status_id,         null: false
      t.integer :delivery_date_id,   null: false
      t.integer :shipping_method_id,   null: false
      t.integer :prefecture_id,   null: false
      t.references :category,    null: false, foreign_key: true
      t.references :saler,    null: false
      t.references :buyer_id
      t.timestamps
    end
  end
end