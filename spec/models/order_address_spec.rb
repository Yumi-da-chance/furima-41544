require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
  end

  describe '購入' do
    context '購入できるとき' do
      it 'postal_code, prefecture_id, city, address_line, building_name, phone_numberが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'priceとtokenがあれば購入ができること' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end

    end

    context '購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeが正しい形式でないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end

      it 'postal_codeがハイフンを含んでいないと購入できない' do
        @order_address.postal_code = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end

      it 'prefecture_idが0だと購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'cityが空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it 'address_lineが空だと購入できない' do
        @order_address.address_line = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address line can't be blank"
      end

      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberが9桁以下では購入できない' do
        @order_address.phone_number = '09012345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end

      it 'phone_numberが12桁以上では購入できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end

      it 'phone_numberにハイフンが含まれていると購入できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end

      it 'phone_numberが半角数値以外の文字を含むと購入できない' do
        @order_address.phone_number = '0901234abcd'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end

      it 'item_idが存在しないと購入できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end

      it 'item_idが整数でないと購入できない' do
        @order_address.item_id = 'abc'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Item is not a number'
      end

      it 'user_idが存在しないと購入できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end

      it 'user_idが整数でないと購入できない' do
        @order_address.user_id = 'abc'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'User is not a number'
      end

      it 'tokenが空では購入できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
