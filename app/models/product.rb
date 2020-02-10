class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charges
  belongs_to :category
  has_many :images, dependent: :destroy, index_errors: true
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :images,:name,:price,:description,:status_id,:delivery_date_id,:shipping_method_id,:prefecture_id,:shipping_charges_id,:categories_id,:saler_id,presence: true
end
