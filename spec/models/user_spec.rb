require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank", "Email is invalid"
    end

    it 'emailは@を含む必要があること' do
      @user.email = 'qqqqqq'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it 'emailが一意性であること' do
      @user.save

      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'passwordとpassword_confirmationは、値の一致が必須であること' do
      @user.password = 'password1'
      @user.password_confirmation = 'password2'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordは6文字以上での入力が必須であること' do
      @user.password = '11'
      @user.password_confirmation = '11'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'passwordが英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid" 
    end
    
    it 'passwordが数字のみでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end

    it 'family_nameが全角でないと登録できない' do
      @user.family_name = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name is invalid"
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'first_nameが全角でないと登録できない' do
      @user.first_name = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end


    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end

    it 'family_name_kanaが全角でないと登録できない' do
      @user.family_name_kana = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid"
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include  "First name kana can't be blank"
    end

    it 'first_name_kanaが全角でないと登録できない' do
      @user.first_name_kana = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end

    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end


  end  
end
