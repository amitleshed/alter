class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products_by_price = Product.where('products.price > ? AND products.price < ?', 100, 400)
    
    if params[:search]
    @products = Product.search(params[:search]).order("created_at DESC")
      else
        @products = Product.all.order('created_at DESC')
      end
  end

  def show
      find_product

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product
    else
      render "new"
    end
  end

def edit
  find_product
end

def update
  find_product
  if @product.update(product_params)
    redirect_to @product
  else
    render 'edit'
  end
end

def destroy
  find_product
  @product.destroy
  redirect_to products_path
end

  private
  def find_product
    @product = Product.find(params[:id])
  end


  def product_params
    params.require(:product).permit(:name, :kind, :image, :describe, :age, :contact, :zipcode, :size, :city)
  end
end

