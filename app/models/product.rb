class Product < ActiveRecord::Base
  has_many :tags, through: :product_tags
  has_many :product_tags
end
