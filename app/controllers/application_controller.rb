class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :logged_in_user, only:[:edit, :update, :destroy]

  # protected

  # def devise_parameter_sanitizer
  #   if resource_class == Trader
  #     TraderParameterSanitizer.new(Trader, :trader, params)
  #   else
  #     super
  #   end
  # end

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
