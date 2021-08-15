class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    redirect_to item_path(params[:item_id])
  end

  def destroy
    @like = Like.destroy
    redirect_to item_path(params[:item_id])
  end
  
end
