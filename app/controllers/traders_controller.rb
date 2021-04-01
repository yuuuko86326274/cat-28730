class TradersController < ApplicationController
  before_action :redirect_root
  
  def show
  end

  private
  def redirect_root
    unless trader_signed_in? || personal_signed_in?
      redirect_to root_path
    end
  end
end
