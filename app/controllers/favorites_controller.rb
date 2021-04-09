class FavoritesController < ApplicationController
  before_action :set_cat
  before_action :authenticate_personal!

  def create
    @favorite = Favorite.new(personal_id: current_personal.id, cat_id: @cat.id)
    respond_to do |format|
      format.js if @favorite.save
    end
  end

  def destroy
    @favorite = Favorite.find_by(personal_id: current_personal.id, cat_id: @cat.id)
    respond_to do |format|
      format.js if @favorite.destroy
    end
  end

  private

  def set_cat
    @cat = Cat.find(params[:cat_id])
  end
end
