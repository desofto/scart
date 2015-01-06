class Product < ActiveRecord::Base
  has_many :tags, through: :product_tags
  has_many :product_tags
  validates :name, presence: true, length: { minimum: 2 }
  validates :cost, presence: true
  default_scope -> { order('name ASC') }
end
