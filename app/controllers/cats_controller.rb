class CatsController < ApplicationController
  before_action :move_to_registration, except: [:index, :show, :search]
  before_action :set_search, only: :search

  def index
    @cats = Cat.includes(:trader).order('created_at DESC').limit(30)
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cats = Cat.new
  end

  def create
    @cats = Cat.new(cat_params)
    if @cats.valid?
      @cats.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.valid?
      @cat.update(cat_params)
      redirect_to cat_path
    else
      render 'edit'
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    if @cat.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  def search
    @cats = Cat.includes(:trader).order('created_at DESC').limit(30)
    if @q = Cat.ransack(params[:q])
      @search_products = @q.result(distinct: true)
    end
  end

  private
    
  def move_to_registration
    redirect_to new_trader_registration_path unless trader_signed_in?
  end

  def cat_params
    params.require(:cat).permit(
      :c_name,
      :c_text,
      :price,
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
      :senior_id,
      images: []
    ).merge(trader_id: current_trader.id)
  end
end
