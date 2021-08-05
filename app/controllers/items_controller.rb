class ItemsController < ApplicationController
  def index
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
    params.required(:item).permit(:image, :name, :explanation, :price, :area_id, :category_id, :status_id, :postage_id, :days_id).merge(user_id: current_user.id)
  end
end
