class SellersController < ApplicationController
  before_action :find_seller, { only: [:edit, :update, :show, :destroy] }

  def index
  	@sellers = Seller.all
    @products = Product.all
  end

  def new
  	@seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      flash[:notice] = 'Seller created successfully!'
      redirect_to sellers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @seller.update(seller_params)
      redirect_to sellers_path
    else
      render :edit
    end
  end

  def show
    @seller = Seller.find(params[:id])
  end

def destroy
    @seller = Seller.find(params[:id])
    if @seller.present?
      @seller.destroy
      flash[:notice] = 'Seller deleted successfully!'
    end
    redirect_to sellers_path
end

  private

  def seller_params
    params.require(:seller).permit(:name, :rating, {product_attributes: [:id, :name, :price, :seller_id]});
  end

  def find_seller
    @seller = Seller.find(params[:id])
  end

  # def print_product
  #   if @seller == product_attributes[:seller_id]
  #     puts "Name" + @product.name
  #     # puts "Price" + @product.price
  #     puts "---------------------------------------------"
  #   else
  #     puts "nema proizvoda za ovog procavaca"
  #   end
end
