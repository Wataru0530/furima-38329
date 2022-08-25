class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  #before_action :contributor_confirmation, only: [:destroy]

  def index
    @users = User.new
  end

  def new
    @product = Product.new
  end

  #def destroy
    #if @furima.destroy
      #redirect_to root_path
    #else
      #redirect_to root_path
   #end
  #end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:item_name, :image, :info, :category_id, :situation_id, :cost_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  #def contributor_confirmation
    #redirect_to root_path unless current_user == @furima.user
  #end

end
