class AddReferenceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :delivary_dates, foreign_key: true
    add_reference :products, :statuses, foreign_key: true
  end
end
