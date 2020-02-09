class Product < ApplicationRecord
  brlongs_to :status
  brlongs_to :user
  brlongs_to :category
  brlongs_to :delivary_date
  has_many :images
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
  end
  validates :images, presence: true
end
