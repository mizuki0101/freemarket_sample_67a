class Product < ApplicationRecord
  validates :images, presence: true
end
