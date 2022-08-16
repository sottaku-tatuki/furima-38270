class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
    # 出品者かつ未購入品のみedit可能になる機能は後に実装
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id, :description, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end