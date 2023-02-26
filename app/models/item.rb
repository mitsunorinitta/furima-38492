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

  #ジャンルの選択が「ーーー」のときは保存できないように設定
  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_ship_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_ship
end
