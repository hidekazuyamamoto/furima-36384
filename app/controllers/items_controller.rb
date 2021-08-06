class ItemsController < ApplicationController
  before_action :move_to_index, only: :new
  def index
    @item = Item.includes(:user).order('create_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_paeams)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_paeams
    params.required(:item).permit(:image, :name, :explanation, :price, :area_id, :category_id, :status_id, :postage_id,
                                  :days_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
