class RemoveProductsFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :images, :products, foreign_key: true
  end
end
