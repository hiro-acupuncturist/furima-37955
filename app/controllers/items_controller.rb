class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ] 
  before_action :set_item, only: [:edit, :show, :update ]
  
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :instructions, :price, :deliveryaddress_id, :category_id, :quality_id,
                                 :deliverycharg_id, :deliveryday_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end