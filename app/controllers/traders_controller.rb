class TradersController < ApplicationController
  def show
    @trader = Trader.find(params[:id])
  end
end
