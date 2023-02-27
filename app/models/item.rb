class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :image

    # 300円以上かつ9，999，999円以下で、半角数字でないと入力不可
    validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

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
