require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)  #Userのインスタンスを生成
  end

  describe "ユーザー新規登録" do
    context "ユーザー登録ができる時" do
      it "必須項目を全て正しく入力すれば、ユーザー登録できる" do
        expect(@user).to be_valid
      end
    end

    context "ユーザー登録ができない時" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailが一意性でなければ登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailは@を含まないと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが数字だけだと登録できない" do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角の英字と数字の両方を含めて設定してください")
      end
      it "passwordが英字だけだと登録できない" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角の英字と数字の両方を含めて設定してください")
      end
      it "全角を含むpasswordでは登録できない" do
        @user.password = "aあa123"
        @user.password_confirmation = "aあa123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角の英字と数字の両方を含めて設定してください")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = 'test1234'
        @user.password = 'test5678'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "first_nameがない場合は登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "second_nameがない場合は登録できない" do
        @user.second_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Second name can't be blank"
      end
      it "first_nameが全角でない場合は登録できない" do
        @user.first_name = "satou"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end
      it "second_nameが全角でない場合は登録できない" do
        @user.second_name = "tetuya"
        @user.valid?
        expect(@user.errors.full_messages).to include "Second name 全角文字を使用してください"
      end
      it "first_name_kanaがない場合は登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "second_name_kanaがない場合は登録できない" do
        @user.second_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Second name kana can't be blank"
      end
      it "first_name_kanaが全角カタカナでない場合は登録できない" do
        @user.first_name_kana = "satou"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カタカナを使用してください"
      end
      it "second_name_kanaが全角カタカナでない場合は登録できない" do
        @user.second_name_kana = "tetuya"
        @user.valid?
        expect(@user.errors.full_messages).to include "Second name kana 全角カタカナを使用してください"
      end
      it "birth_dayがない場合は登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end

  end
end
