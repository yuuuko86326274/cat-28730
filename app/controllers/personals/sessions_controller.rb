# frozen_string_literal: true

class Personals::SessionsController < Devise::SessionsController
  def new_guest
    personal = Personal.guest
    sign_in personal
    redirect_to root_path, notice: 'ゲストユーザー（猫を飼いたい方）としてログインしました。'
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
