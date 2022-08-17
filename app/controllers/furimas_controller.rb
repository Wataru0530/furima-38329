class FurimasController < ApplicationController

  def index
  end

  def new
    @furima = Furima.new
  end

  def destroy
    if @furima.destroy
      redirect_to root_path
    else
      redirect_to root_path
   end
  end


end
