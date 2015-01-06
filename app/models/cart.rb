class Cart < ActiveRecord::Base
  belongs_to :product

  def Cart.find( product_id = nil )
    return where( session_id: @session ) if product_id.nil?
    find_by( session_id: @session, product_id: product_id )
  end

  def Cart.add( product_id )
    rec = Cart.find( product_id )
    rec = Cart.new( session_id: @session, product_id: product_id, count: 0 ) if rec.nil?
    rec.count = rec.count + 1
    rec.save!
  end

  def Cart.delete( product_id )
    rec = Cart.find( product_id )
    rec.destroy!
  end

  def Cart.clear
    recs = Cart.find()
    recs.each { |rec| rec.destroy! }
  end

  def Cart.total( cart )
    total = 0
    cart.each { |item| total += item.product.cost * item.count }
    total
  end
end
