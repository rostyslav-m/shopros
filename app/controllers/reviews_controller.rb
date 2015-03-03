class ReviewsController < ApplicationController

  before_filter :find_product
#, only: [:show, :edit, :update, :destroy]

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

end