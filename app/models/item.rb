class Item < ApplicationRecord

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :item_category_id, presence: true
  validates :item_condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_ship_id, presence: true
  validates :item_price, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end
