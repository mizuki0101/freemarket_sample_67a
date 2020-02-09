class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
  end
  validates :images, presence: true
end
