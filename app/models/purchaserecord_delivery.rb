class PurchaserecordDelivery
  include ActiveModel::Model
  attr_accessor :postcode, :deliveryaddress_id, :municipalitids, :address, :building, :tel, :user_id, :item_id, :token


  with_options presence: true do
    validates :deliveryaddress_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :postcode,           format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalitids
    validates :address
    validates :user_id
    validates :token
    validates :item_id
    validates :tel,                format: { with: /\A\d{10,11}\z/, message: "PhoneNumber must be 10or11 digit Half-width numbers" }
  end

  def save
    purchaserecord = Purchaserecord.create(item_id: item_id, user_id: user_id)
    Delivery.create(deliveryaddress_id: deliveryaddress_id, postcode: postcode, municipalitids: municipalitids, address: address, building: building, tel: tel, purchaserecord_id: purchaserecord.id)
  end


end