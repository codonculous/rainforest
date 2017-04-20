class ProductsController < ApplicationController
  def index
    @products = Product.all

  end

  def show
    product_find

  end

  def new
    product_create
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def edit
    product_find
  end

  def update
    product_find
    if @product.update_attributes(product_params)
      redirect_to product_url(@product)
    else
      render :edit
    end
  end

  def destroy
    product_find
    @product.destroy
    redirect_to products_url


  end
private

  def product_create
    @product = Product.new

  end

  def product_find
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)

  end

end
