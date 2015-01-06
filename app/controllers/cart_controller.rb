class CartController < ApplicationController
  before_action :generate_session

  def index
    @tags = Tag.all
    tagId = params[:tag];
    unless tagId.nil? || ( @tag = Tag.find_by( id: tagId ) ).nil?
      @products = @tag.products
    else
      @products = Product.all
    end
  end

  def show
    @cart = Cart.find()
    actions = Action.active( @cart )
    @subTotal = Cart.total( @cart )
    @total = Action.total( actions, @subTotal )
  end

  def add
    Cart.add( params[ :product ] )
    redirect_to '/cart/show'
  end

  def update
    product_id = params[ :product ]
    if ( count = params[ :count ] ).to_i > 0
      cart = Cart.find( product_id )
      cart.count = count
      cart.save!
    else
      Cart.delete( product_id )
    end
    redirect_to '/cart/show'
  end

  def delete
    Cart.delete( params[ :product ] )
    redirect_to '/cart/show'
  end

  def clear
    Cart.clear()
    redirect_to '/cart/show'
  end

  private
    def generate_session
      @session = cookies.permanent[ :session ]
      return unless @session.nil? || @session.empty?
      require 'securerandom'
      cookies.permanent[ :session ] = @session = SecureRandom.hex
    end
end
