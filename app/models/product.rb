class Product < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy, index_errors: true
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :images, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :status_id, presence: true
  validates :delivery_date_id, presence: true
  validates :shipping_method_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_method_id, presence: true
  validates :categories_id, presence: true
  validates :saler_id, presence: true
    
end
