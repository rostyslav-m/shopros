class CategoriesController < ApplicationController

  before_filter :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
    @category.destroy
    redirect_to categories_path  #action: "index"
  end

  def update
    if @category.update(categories_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end


  def create
    @categories = Category.new(categories_params)

    if @categories.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

 def categories_params
    params.require(:category).permit(:name_cat)
  end
end
