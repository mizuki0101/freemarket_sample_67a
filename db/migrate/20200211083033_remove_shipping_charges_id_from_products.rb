class RemoveShippingChargesIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :shipping_charges_id, :integer, null: false
  end
end
