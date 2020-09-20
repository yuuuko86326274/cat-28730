class CatsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end
  
  def create
    @cat = Cat.new(cat_params)
  end

  private
  def move_to_index
    unless trader_signed_in?
      redirect_to action: :index 
    end
  end

  def cat_params
    params.require(:cat).permit(
      :c_name,
      :c_images,
      :c_text,
      :breed_id,
      :ope_id,
      :sex_id,
      :age_id,
      :hair_length_id,
      :color_id,
      :how_many_id,
      :eye_color_id,
      :character_id,
      :fleas_id,
      :veccine_id,
      :kuchu_id,
      :single_id,
      :senior_id
      ).merge(trader_id: current_trader.id)
  end
end
