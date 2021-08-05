require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき' do
      it '記入項目に漏れなく、正しく記入できていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '登録できない（nickname）' do
      it 'nicknameがなければ保存できない'do
        @user.nickname = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickame can't be blank")
      end
    end
    context '登録できない（email）' do
      it 'emailがなければ保存できない' do
        @user.email = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが事前に登録されていると保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    end
    context '登録できない（password）' do
      it 'パスワードが６文字以上でないと保存できない' do
        @user.password = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("hoge")
      end
      it 'パスワードは、半角数字のみだとと保存できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
      it 'パスワードは、半角英字のみだとと保存できない' do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
      it 'パスワードとパスワード（確認）は、値の一致でないと保存できない' do
        @user.password_confirmation = aaaaa
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
    end
    context '登録できない（first_name & last_name）' do
      it 'お名前(全角)は、名字がないと保存できない' do
        @user.last_name = " "
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前(全角)は、名前がないと保存できない' do
        @user.first_name = " "
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前(全角)は、苗字は英字では保存できない' do
        @user.last_name = "test"
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前(全角)は、苗字は数字では保存できない' do
        @user.last_name = "1234"
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前(全角)は、名前は英字では保存できない' do
        @user.first_name = "test"
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前(全角)は、名前は数字では保存できない' do
        @user.first_name = "1234"
        @user.valid?
        expect(@user).to include("")
      end
    end
    context '登録できない（first_name_kana & last_name_kana）' do
      it 'お名前カナ(全角)は、名字がないと保存できない' do
        @user.last_name_kana = " "
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前カナ(全角)は、ひらがなでは保存できない' do
        @user.last_name_kana = "てすと"
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前カナ(全角)は、漢字では保存できない' do
        @user.last_name_kana = "試験"
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前カナ(全角)は、英字では保存できない' do
        @user.last_name_kana = "test"
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前カナ(全角)は、数字では保存できない' do
        @user.last_name_kana = "1234"
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前カナ(全角)は、名前がないと保存できない' do
        @user.first_name_kana = " "
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前カナ(全角)は、ひらがなでは保存できない' do
        @user.first_name_kana = "てすと"
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前カナ(全角)は、漢字では保存できない' do
        @user.first_name_kana = "試験"
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前カナ(全角)は、英字では保存できない' do
        @user.first_name_kana = "test"
        @user.valid?
        expect(@user).to include("")
      end
      it 'お名前カナ(全角)は、数字では保存できない' do
        @user.first_name_kana = "1234"
        @user.valid?
        expect(@user).to include("")
      end
    end
    context '登録できない（birthday）' do
      it '生年月日が無ければ保存できない' do
        @user.birthday = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
    end
  end
end
