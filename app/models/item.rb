class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :deliveryaddress
  belongs_to :category
  belongs_to :quality
  belongs_to :deliverycharg
  belongs_to :deliveryday

  with_options presence: true do
    validates :deliveryaddress,  numericality: { other_than: 0 , message: "can't be blank"}
    validates :category_id,      numericality: { other_than: 1 , message: "can't be blank"}
    validates :quality_id,       numericality: { other_than: 1 , message: "can't be blank"}
    validates :deliverycharg,    numericality: { other_than: 1 , message: "can't be blank"}
    validates :deliveryday,      numericality: { other_than: 1 , message: "can't be blank"}

    validates :name           
    validates :instructions 
    validates :price,            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  end
end
