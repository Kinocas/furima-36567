class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_shopping = OrderShopping.new
  end

  def create
    @order_shopping = OrderShopping.new(order_params)
    if @order_shopping.valid?
      @order_shopping.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shopping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
