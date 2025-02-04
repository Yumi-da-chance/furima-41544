require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category)
    @condition = FactoryBot.create(:condition)
    @shipping_cost = FactoryBot.create(:shipping_cost)
    @prefecture = FactoryBot.create(:prefecture)
    @shipping_day = FactoryBot.create(:shipping_day)
    @item = FactoryBot.build(:item,
                             user: @user,
                             category: @category,
                             condition: @condition,
                             shipping_cost: @shipping_cost,
                             prefecture: @prefecture,
                             shipping_day: @shipping_day)
  end

  describe '出品' do
    context '出品できるとき' do
      it 'item_name, item_information, category_id, condition_id, shipping_cost_id,prefecture_id, shipping_day_id, priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'imageを1枚つけないと出品できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'item_nameが空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'item_informationが空だと出品できない' do
        @item.item_information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item information can't be blank"
      end

      it 'categoryが空だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'condition_idが空だと出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it 'shipping_cost_idが空だと出品できない' do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end

      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'shipping_cost_idが空だと出品できない' do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が¥10,000,000以上であれば保存不可' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end

      it '価格が¥299以下であれば保存不可' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it '価格は半角数値のみ保存可能' do
        @item.price = '１２３４' # 全角数値
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')

        @item.price = '1234abc' # 数値と文字列
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'ユーザーが紐づいていないと保存できない' do
        @item.user = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist') 
      end
    end
  end
end
