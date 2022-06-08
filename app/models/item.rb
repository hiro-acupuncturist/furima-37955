class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image

  belongs_to :deliveryaddress
  belongs_to :category
  belongs_to :quality
  belongs_to :deliverycharg
  belongs_to :deliveryday
  belongs_to :user
  has_one    :purchaserecord

  with_options presence: true do
    validates :deliveryaddress_id,  numericality: { other_than: 0 , message: "can't be blank"}
    validates :category_id,         numericality: { other_than: 1 , message: "can't be blank"}
    validates :quality_id,          numericality: { other_than: 1 , message: "can't be blank"}
    validates :deliverycharg_id,    numericality: { other_than: 1 , message: "can't be blank"}
    validates :deliveryday_id,      numericality: { other_than: 1 , message: "can't be blank"}

    validates :image
    validates :name           
    validates :instructions 
    validates :price,            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
  end
end
