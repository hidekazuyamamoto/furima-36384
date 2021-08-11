class PurchasedsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index
  def index
    @item = Item.find(params[:item_id])
    @params_purchased = PurchasedOrder.new
  end

  def new
  end
  
  def create
    @params_purchased = PurchasedOrder.new(params_purchased)
    if @params_purchased.valid?
      pay_item
      @params_purchased.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def params_purchased
    params.require(:purchased_order).permit(:postal_code, :city, :address, :building_name, :telephone_number, :area_id).merge(item_id: params[:item_id], item_price: Item.find(params[:item_id]).price,user_id: current_user.id, token: params[:token])
  end
  def pay_item
    Payjp.api_key = "sk_test_3fe0599d60ff16e49b632d78"  
    Payjp::Charge.create(
      amount: params_purchased[:item_price],  
      card: params_purchased[:token],    
      currency: 'jpy'   
    )
  end
  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.user.id == current_user.id 
      redirect_to root_path
    else
      unless @item.purchased == nil
        redirect_to root_path
      end
    end
  end
end
