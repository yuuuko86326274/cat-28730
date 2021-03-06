#  frozen_string_literal: true

class Traders::SessionsController < Devise::SessionsController
  before_action :redirect_root
  def new_guest
    trader = Trader.guest
    sign_in trader
    redirect_to root_path, notice: 'ゲストユーザー（猫を保護した方）としてログインしました。'
  end

  def redirect_root
    if personal_signed_in?
      redirect_to root_path
    end 
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
