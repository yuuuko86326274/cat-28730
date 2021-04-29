class TradersController < ApplicationController
  before_action :redirect_root

  def show
    
  end

  private

  def redirect_root
    redirect_to root_path unless trader_signed_in? || personal_signed_in?
  end
end
