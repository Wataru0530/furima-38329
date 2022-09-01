class InformationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @information_residence = InformationResidence.new
  end

  def create
    @information_residence = InformationResidence.new(information_params)
    if @information_residence.valid?
      pay_product
      @information_residence.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def information_params
    params.require(:information_residence).permit(:code, :area_id, :city, :address, :building, :phone).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    #redirect_to root_path if current_user.id == @product.user_id || @product.information.present?
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: information_params[:token],
      currency: 'jpy'
    )
  end
end