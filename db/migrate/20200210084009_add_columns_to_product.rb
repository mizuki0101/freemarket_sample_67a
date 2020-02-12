class AddColumnsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :categories, foreign_key: true, null: false
    add_column :products, :saler_id, :integer, null: false
    add_column :products, :buyer_id, :integer
  end
end
