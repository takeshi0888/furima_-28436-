class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else render action: :new
    end
  end

  def price
    @price = price(price_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :genre_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
