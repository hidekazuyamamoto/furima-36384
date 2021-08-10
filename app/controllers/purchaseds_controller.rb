class PurchasedsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @params_purchased = PurchasedOrder.new
  end

  def new
  end
  
  def create
    @params_purchased = PurchasedOrder.new(params_purchased)
    if @params_purchased.valid?
      @params_purchased.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def params_purchased
    params.require(:purchased_order).permit(:postal_code, :city, :address, :building_name, :telephone_number, :area_id).merge(item_id: params[:item_id],user_id: current_user.id)
  end
end
