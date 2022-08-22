class FurimasController < ApplicationController
  #before_action :contributor_confirmation, only: [:destroy]

  def index
    @users = User.new
  end

  def new
    @furima = Furima.new
  end

  #def destroy
    #if @furima.destroy
      #redirect_to root_path
    #else
      #redirect_to root_path
   #end
  #end

  #def create
   # @furima = Furima.new(furima_params)
    #if @furima.save
      #redirect_to root_path
    #else
      #render :new
    #end
  #end

  #private

  #def furima_params
    #params.require(:furima).permit(:nickname, :firstname, :lastname, :firstnamekana, :lastnamekana, :birth)
  #end

  #def contributor_confirmation
    #redirect_to root_path unless current_user == @furima.user
  #end

end
