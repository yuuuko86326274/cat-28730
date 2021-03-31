class PersonalsController < ApplicationController
  before_action :redirect_root
  def show
    if personal_signed_in?
      cat = Favorite.where(personal_id: current_personal.id).pluck(:cat_id)
      @favorites = Cat.find(cat)
    end
  end

  private
  def redirect_root
    unless trader_signed_in? || personal_signed_in?
      redirect_to root_path
    end
  end
end
