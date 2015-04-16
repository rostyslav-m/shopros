class ProductsController < ApplicationController

  before_filter :find_product, only: [:show, :edit, :update, :destroy]
  before_filter :user_admin,   only: [:new, :create, :edit, :update, :destroy]

  def index
#    @products = Product.all

    @search = Product.search(params[:q])
    @products = @search.result(:distinct => true).order(:created_at).reverse_order.paginate(:page => params[:page], :per_page => 5)
  
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to action: "index"
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :category_id)
    end

  private
    def find_product   
      @product = Product.find(params[:id])
    end

  private
    def user_admin
      redirect_to products_path if ((current_user == nil)||(current_user.is_admin == false))
    end

end