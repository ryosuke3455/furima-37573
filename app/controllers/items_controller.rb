class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
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

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :quality_id, :explanation, 
      :prefecture_id, :delivery_charge_id, :posting_id, :images).merge(user_id: current_user.id)
  end
end
