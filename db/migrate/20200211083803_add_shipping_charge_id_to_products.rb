class AddShippingChargeIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :shopping_charge_id, :integer, null: false
  end
end
