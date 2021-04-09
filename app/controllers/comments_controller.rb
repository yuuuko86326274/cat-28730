class CommentsController < ApplicationController
  def create
    @cat = Cat.find(params[:cat_id])
    @comment = if personal_signed_in?
                 Comment.create(comment_params_personal)
               else
                 Comment.create(comment_params_trader)
               end
    redirect_to cat_path(@cat)
  end

  private

  def comment_params_personal
    params.require(:comment).permit(:comment).merge(cat_id: @cat.id).merge(personal_id: current_personal.id)
  end

  def comment_params_trader
    params.require(:comment).permit(:comment).merge(cat_id: @cat.id).merge(trader_id: current_trader.id)
  end
end
