class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]


  def index
    @purchaserecord_delivery = PurchaserecordDelivery.new

  end

  def new
  end

  def create
    @purchaserecord_delivery = PurchaserecordDelivery.new(purchaserecord_delivery)
    
    if @purchaserecord_delivery.valid?
      @purchaserecord_delivery.save
      redirect_to root_path
    else
      render :index 
    end
  end
  private
  
  def purchaserecord_delivery
    params.require(:purchaserecord_delivery).permit(:postcode, :deliveryaddress_id, :municipalitids, :address, :building, :tel).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
