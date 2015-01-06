class Tag < ActiveRecord::Base
  has_many :products, through: :product_tags
  has_many :product_tags
  validates :name, presence: true, length: { minimum: 2 }
  default_scope -> { order('name ASC') }
end
