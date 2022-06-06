class ItemsController < ApplicationController
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
    params.require(:item).permit(:name, :instructions, :price, :deliveryaddress_id, :category_id, :quality_id, :deliverycharg_id, :deliveryday_id, :user_id)
  end

end
