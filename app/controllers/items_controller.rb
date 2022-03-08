class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root, only: [:edit, :destroy]
  before_action :sold_out, only: :edit

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
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
    params.require(:item).permit(:name, :category_id, :price, :quality_id, :explanation, 
      :prefecture_id, :delivery_charge_id, :posting_id, :image).merge(user_id: current_user.id)
  end

  def find_id
    @item = Item.find(params[:id])
  end

  def redirect_to_root
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def sold_out
    if @item.bought_rec.present?
      redirect_to root_path
    end
  end
end
