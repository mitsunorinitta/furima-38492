class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_condition_id, :shipping_charge_id, :prefecture_id, :days_ship_id, :item_price, :image).merge(user_id: current_user.id)
end
