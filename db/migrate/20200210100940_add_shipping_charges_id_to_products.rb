class AddShippingChargesIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :shipping_charges_id, :integer, null: false
  end
end
