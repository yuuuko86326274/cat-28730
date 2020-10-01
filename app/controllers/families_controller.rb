class FamiliesController < ApplicationController
  # require 'date'
  require 'payjp'
  
  before_action :move_to_login
  before_action :cat_id_search
  before_action :family_cat
  
  def index
    @donation = Donations.new
  end
  
  def new
    @donation = Donations.new
  end
  
  def create
    # @trader = Trader.find(params[:id])
    # @donation = Donation.new(donation_params)
    # date = params.permit(:birthday)
    # birthday = Date.parse.date
    @donation = Donations.new(donation_params)
    
    if @donation.valid?
      @donation.save
      pay_donation
      # binding.pry
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  def move_to_login
    redirect_to  new_personal_session_path unless personal_signed_in?
  end
  
  def cat_id_search
    @cat = Cat.find(params[:cat_id])
    @trader = @cat.trader_id
  end
  
  def family_cat
    redirect_to root_path if @cat.family.present? #|| current_trader.id == @cat.trader_id
  end
  
  def donation_params
    # date = params.permit(:birthday)
    params.permit(
      :donation,
      :first_name,
      :last_name,
      :first_pkey,
      :last_pkey,
      :postal_code,
      :area_id,
      :city,
      :address_num,
      :building_num,
      :tel,
      :message,
      :token
    ).merge(cat_id: @cat.id)
    .merge(personal_id: current_personal.id)
    .merge(trader_id: @trader)
    # .merge(birthday: date)
  end

  def pay_donation
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: donation_params[:donation],
      card: donation_params[:token],
      currency: 'jpy'
    )
  end
end
