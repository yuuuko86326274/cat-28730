class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    root_path
  end

  def set_search
    @q = Cat.ransack(params[:q])
    @q.build_condition if @q.conditions.empty?
    @character = Character.all
    @sex = Sex.all
    @ope = Ope.all
    @age = Age.all
    @fleas = Fleas.all
    @veccine = Veccine.all
    @kuchu = Kuchu.all
    @breed = Breed.all
    @hair_length = HairLength.all
    @color = Color.all
    @eye_color = EyeColor.all
    @how_many = HowMany.all
    @single = Single.all
    @senior = Senior.all
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
