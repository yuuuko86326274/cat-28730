module ApplicationHelper

  def reset_tag(value = "Reset form", options = {})
    options = options.stringify_keys
    tag :input, { type: "reset", value: value }.update(options)
  end
  # def log_in(user)
  #   session[:user_id] = user.id
  # end

  # def current_user
  #   if session[:user_id]
  #    #@current_user = @current_user || User.find_by(id: session[:user_id])と同じ意味
  #     @current_user ||= User.find_by(id: session[:user_id])
  #   end
  # end

  # def current_user?(user)
  #   user == current_user
  # end

  # def logged_in?
  #   !current_user.nil?
  # end

  # def log_out
  #   session.delete(:user_id)
  #   @current_user = nil
  # end
end
