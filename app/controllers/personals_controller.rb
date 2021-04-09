class PersonalsController < ApplicationController
  def show
    cats = Family.where(personal_id: current_personal.id).pluck(:cat_id)
    @cats = Cat.find(cats)
    cat = Favorite.where(personal_id: current_personal.id).pluck(:cat_id)
    @favorites = Cat.find(cat)
  end
end
