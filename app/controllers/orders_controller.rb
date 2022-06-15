class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index] 
  before_action :set_item, only: [:index, :create]
  before_action :user_block, only: [:index ]

  
  def index
    @purchaserecord_delivery = PurchaserecordDelivery.new

  end

  def create
    @purchaserecord_delivery = PurchaserecordDelivery.new(purchaserecord_delivery)
    if @purchaserecord_delivery.valid?
      pay_item
      @purchaserecord_delivery.save
      redirect_to root_path
    else
      render :index 
    end
  end

  private
  
  def purchaserecord_delivery
    params.require(:purchaserecord_delivery).permit(:postcode, :deliveryaddress_id, :municipalitids, :address, :building, :tel).merge( user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_block
    if current_user.id == @item.user_id || @item.purchaserecord.present?
      redirect_to root_path 
    end
  end
  
  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:  @item.price,
        card:    purchaserecord_delivery[:token],
        currency: 'jpy'
      )
  end


end
