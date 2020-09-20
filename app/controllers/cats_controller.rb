class CatsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :t_move_to_index, except: [:index, :show]

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
    unless personal_signed_in?
      redirect_to action: :index 
    end
  end

  def t_move_to_index
    unless trader_signed_in?
      redirect_to action: :index 
    end
  end
end
