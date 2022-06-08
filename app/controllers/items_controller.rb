class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order(created_at: :desc)
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
    params.require(:item).permit(:image, :name, :instructions, :price, :deliveryaddress_id, :category_id, :quality_id,
                                 :deliverycharg_id, :deliveryday_id).merge(user_id: current_user.id)
  end
end
