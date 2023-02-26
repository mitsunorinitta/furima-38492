require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) #Itemのインスタンスを生成
  end

  describe "商品の出品" do
    context "商品の出品が成功する時" do
      it "必要な情報を全て適切に入力して「出品する」を押すと、出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品の出品が失敗する時" do
      it "商品画像が1枚も無いと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "商品名が空では登録できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it "商品の説明が空では登録できない" do
        @item.item_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item description can't be blank"
      end
      it "カテゴリーの情報が空では登録できない" do
        @item.item_category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end
      it "商品の状態の情報が空では登録できない" do
        @item.item_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
      it "配送料の負担の情報が空では登録できない" do
        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
      end
      it "発送元の地域の情報が空では登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "発送までの日数の情報が空では登録できない" do
        @item.days_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Days ship can't be blank"
      end
      it "価格の情報が空では登録できない" do
        @item.item_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end
      it "価格の情報が¥300未満だと登録できない" do
        @item.item_price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be greater than or equal to 300"
      end
      it "価格の情報が¥10,000,000以上だと登録できない" do
        @item.item_price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be less than or equal to 9999999"
      end
      it "価格の情報が全角だと登録できない" do
        @item.item_price = "９９９"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not a number"
      end
    end
  end
end
