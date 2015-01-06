class ProductTag < ActiveRecord::Base
  belongs_to :product
  belongs_to :tag
  validates :product, presence: true
  validates :tag, presence: true
end
