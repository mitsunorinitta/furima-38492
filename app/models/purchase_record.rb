class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :Shipping_information
end
