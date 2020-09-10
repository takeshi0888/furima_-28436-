class OrdersController < ApplicationController
  before_action :user_sighn, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = OrderDeliveryAddress.new

    return redirect_to root_path if @item.order.present?

    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderDeliveryAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def user_sighn
    redirect_to new_user_session_path unless user_signed_in?
  end

  def order_params
    params.permit(:token, :item_id, :postal_code, :prefecture_id, :address1, :address2, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
