class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_id, only: [:index, :create]
  before_action :redirect_to_root, only: [:index, :create]

  def index
    @order = OrderForm.new
  end
  
  def create
    @order = OrderForm.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:token, :price, :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building, :phone)
    .merge(user_id: current_user.id).merge(item_id: @item.id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_c86960321c3dfa9528e6e19d"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def redirect_to_root
    if current_user == @item.user || @item.bought_rec.present?
      redirect_to root_path
    end
  end

  def find_id
    @item = Item.find(params[:item_id])
  end
end
