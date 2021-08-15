class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, except: [:index, :new, :create, :search]
  before_action :move_to_index, only: [:edit, :update, :destory]
  before_action :move_to_index_purchased, only: [:edit, :update, :destroy]
  def index
     @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item_back = Item.where("id < ?", params[:id]).order("id DESC").first
    @item_next = Item.where("id > ?", params[:id]).order("id ASC").first
    @like = Like.where(item_id: params[:id]).length
  end

  def edit
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.required(:item).permit(:image, :name, :explanation, :price, :area_id, :category_id, :status_id, :postage_id,
                                  :days_id).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def move_to_index
    unless current_user.id == @item.user.id 
      redirect_to root_path
    end
  end
  def move_to_index_purchased
    unless @item.purchased == nil
      redirect_to root_path
    end
  end

end
