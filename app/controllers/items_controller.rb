class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @item = Item.includes(:user).order('create_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_paeams)
  end

  private

  def item_paeams
    params.required(:item).permit(:image, :name, :explanation, :price, :area_id, :category_id, :status_id, :postage_id,
                                  :days_id).merge(user_id: current_user.id)
  end

end
