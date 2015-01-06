class Action < ActiveRecord::Base
  DISCOUNT_PERCENT = 'discount percent'
  DISCOUNT_VALUE = 'discount value'

  belongs_to :tag
  belongs_to :product
  
  validates :name, presence: true, length: { minimum: 2 }
  validates :count, presence: true
  validate :validateTarget

  def discount_type= ( value )
    case value
    when Action::DISCOUNT_PERCENT, Action::DISCOUNT_VALUE
      super
    else
      raise "Wrong the discount type"
    end
  end

  def Action.active( cart )
    Action.all.to_a.delete_if { |action| !action.active?( cart ) }
  end

  def active?( cart )
    require 'date'
    return false unless ( date_from.nil? || Time.now > date_from ) && ( date_to.nil? || Time.now < date_to )

    count = 0

    case
    when !self.tag_id.nil? && self.tag_id > 0
      cart.each do |item|
        tags = item.product.tags.map { |tag| tag.id }
        count += item.count if tags.include?( self.tag.id )
      end
    when !self.product_id.nil? && self.product_id > 0
      cart.each do |item|
        count += item.count if item.product_id == self.product_id
      end
    else
      raise "Wrong the action parameters " + self.id.to_s + "."
    end

    return count >= self.count
  end

  def Action.total( actions, subTotal )
    total = subTotal
    actions.each do |action|
      total -= action.discount_value if action.discount_type == Action::DISCOUNT_VALUE
    end
    actions.each do |action|
      total = total * action.discount_value / 100 if action.discount_type == Action::DISCOUNT_PERCENT
    end
    total
  end

  private

    def validateTarget
      if self.product.nil? && self.tag.nil?
        errors.add( :product, "either tag or product must be specified" )
        errors.add( :tag, "either tag or product must be specified" )
      end
    end
end
