class CategoriesController < ApplicationController
  before_action :find_category, { only: [:edit, :update, :show, :destroy] }

  def index
  	@categories = Category.all
    @products = Product.all
  end

  def new
  	@category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category created successfully!'
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def show
    @category = Category.find(params[:id])
  end

def destroy
    @category = Category.find(params[:id])
    if @category.present?
      @category.destroy
      flash[:notice] = 'Category deleted successfully!'
    end
    redirect_to categories_path
end

  private

  def category_params
    params.require(:category).permit(:name, :description, {product_attributes: [:id, :name, :price, :category_id]});
  end

  def find_category
    @category = Category.find(params[:id])
  end
end