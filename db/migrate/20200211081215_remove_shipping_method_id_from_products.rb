class RemoveShippingMethodIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :shipping_method_id, :integer, null: false
  end
end
