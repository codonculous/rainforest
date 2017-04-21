class ReviewsController < ApplicationController
  before_action :load_product
  before_action :ensure_logged_in, only: [:create, :destroy]

  def show
   @review = Review.find(params[:id])
  end

  def create
   @review = @product.reviews.build(review_params)
   @review.user = current_user
     # Check out this article on [.build](http://stackoverflow.com/questions/783584/ruby-on-rails-how-do-i-use-the-active-record-build-method-in-a-belongs-to-rel)
    if @review.save
     redirect_to products_url, notice: 'Review created successfully'
    else
     render 'products/show'
    end
  end

  def destroy
   @review = Review.find(params[:id])
   @review.destroy
  end

  private
  def review_params
   params.require(:review).permit(:comment, :product_id)
  end

  def load_product
   @product = Product.find(params[:product_id])
  end

end
