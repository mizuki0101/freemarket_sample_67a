class CreateDelivaryDates < ActiveRecord::Migration[5.2]
  def change
    create_table :delivary_dates do |t|
      t.string :status
      t.timestamps
    end
  end
end
