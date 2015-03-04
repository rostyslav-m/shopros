class ReviewsController < ApplicationController

  before_filter :find_product
  before_filter :user_admin, only: [:destroy]
  
  def create
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.save
    redirect_to product_path(@product)
  end

  def destroy
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private
    def review_params
      params.require(:review).permit(:user, :msg)
    end

  private
    def find_product   
      @product = Product.find(params[:product_id])
    end

  private
    def user_admin
      redirect_to products_path if ((current_user == nil)||(current_user.is_admin == false))
    end

end