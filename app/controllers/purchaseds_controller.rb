class PurchasedsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end
  
  def create
    @purchased = Purchased.create(params_purchased)
    Order.create(params_order)
    redirect_to root_path
  end

  private
  def params_purchased
    params.permit(:item_id).merge(user_id: current_user.id)
  end
  def params_order
    params.permit(:postal_code, :area_id, :city, :address, :building_name, :telephone_number).merge(purchased_id: @purchased.id)
  end
end
