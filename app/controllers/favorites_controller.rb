class FavoritesController < ApplicationController
  before_action :set_cat
  before_action :authenticate_personal!
 
  def create
    @favorite = Favorite.new(personal_id: current_personal.id, cat_id: @cat.id)
    respond_to do |format|
      if @favorite.save
        format.js
      end
    end
  end

  def destroy
    @favorite = Favorite.find_by(personal_id: current_personal.id, cat_id: @cat.id)
    respond_to do |format|
      if @favorite.destroy
        format.js
      end
    end
  end

  private
  def set_cat
    @cat = Cat.find(params[:cat_id])
  end

end
