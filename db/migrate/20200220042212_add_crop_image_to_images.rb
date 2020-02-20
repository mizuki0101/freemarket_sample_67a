class AddCropImageToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :croped_image, :text, :limit => 4294967295
  end
end
