class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :set_order
  before_action :move_to_root

  def index
    @order_shopping = OrderShopping.new
  end

  def create
    @order_shopping = OrderShopping.new(order_params)
    if @order_shopping.valid?
      pay_item
      @order_shopping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shopping).permit(
      :postal_code, :prefecture_id, :city, :address, :building, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(order_params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order
    @order = Order.where(item_id: params[:item_id])
  end

  def move_to_root
    if current_user.id == @item.user_id || !@order.empty?
      redirect_to root_path
    end
  end

end
