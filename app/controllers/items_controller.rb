class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :item_category_id, :item_condition_id, :shipping_charge_id, :ship_area_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end

end
