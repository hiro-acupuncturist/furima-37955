class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :deliveryaddress
  belongs_to :category_id
  belongs_to :quality_id
  belongs_to :deliverycharg
  belongs_to :deliveryday

  validates :deliveryaddress, presence: true, numericality: { other_than: 0 , message: "can't be blank"}
  validates :category_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :quality_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :deliverycharg,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :deliveryday,     presence: true, numericality: { other_than: 1 , message: "can't be blank"}

  validates :name,           presence: true
  validates :instructions,   presence: true
  validates :price,          presence: true

end
