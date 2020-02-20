class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  attr_accessor :x
  attr_accessor :y
  attr_accessor :width
  attr_accessor :height
  belongs_to :product
  validates :src, presence: true
end


