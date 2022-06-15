class Purchaserecord < ApplicationRecord
  belongs_to :user
  has_one    :delivery
  belongs_to :item
end

