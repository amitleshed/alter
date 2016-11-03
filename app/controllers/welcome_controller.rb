class WelcomeController < ApplicationController
  def index
    @products = Product.all
    # @products_by_price = Product.where('products.price > ? AND products.price < ?', 100, 400)
    if params[:search]
    @products = Product.search(params[:search]).order("created_at DESC")
      else
        @products = Product.all.order('created_at DESC')
      end
    end
  def about
  end
end
