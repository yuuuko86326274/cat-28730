# frozen_string_literal: true

class Traders::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create, :edit, :update, :destroy]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:t_name, :t_postal_code, :area_id, :t_city, :t_address_num, :t_building_num, :t_tel])
  end

  #  更新（編集の反映）時にパスワード入力を省く
  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  #  更新後のパスを指定
  # def after_update_path_for(resource)
  #   trader_path(@trader.id)
  # end

  # def after_update_path_for(_resource)
  #   trader_path(id: current_trader.id)
  # end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
