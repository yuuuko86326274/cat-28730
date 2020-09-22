class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
  # before_action :logged_in_user, only:[:edit, :update, :destroy]

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:t_name, :t_postal_code, :area_id, :t_city, :t_address_num, :t_tel])
  # end

  # def create
  #   user = User.find_by(nickname: params[:session])
  #   if user && current_user(params[:session])
  #     log_in user
  #     redirect_to root_path
  #   else
  #     render 'devise/registrations#new'
  #   end
  # end

  # def destroy
  #   log_out if logged_in?
  #   redirect_to root_url
  # end

  # def logged_in_user
  #   unless logged_in?
  #     redirect_to login_url
  #   end
  # end
end
