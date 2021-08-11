require 'rails_helper'

RSpec.describe PurchasedOrder, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @purchased_order = FactoryBot.build(:purchased_order, user_id: user.id, item_id: item.id)
    sleep 0.1 
  end
  describe '商品購入の入力の際' do
    context '購入できる場合' do
      it '問題がなく記入できたら購入できる' do
        expect(@purchased_order).to be_valid
      end
      it '建物名がなくても保存できる' do
        @purchased_order.building_name = " "
        expect(@purchased_order).to be_valid
      end
    end
    context '購入できない場合' do
      it 'user_idがないと保存できない' do
        @purchased_order.user_id = nil
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと保存できない' do
        @purchased_order.item_id = nil
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号がない場合' do
        @purchased_order.postal_code = " "
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'トークンがない場合' do
        @purchased_order.token = " "
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号にハイフンががない場合' do
        @purchased_order.postal_code = "1234567"
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県を指定していない場合' do
        @purchased_order.area_id = 0
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("Area must be other than 0")
      end
      it '市町村がない場合' do
        @purchased_order.city = " "
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地がない場合' do
        @purchased_order.address = " "
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がない場合' do
        @purchased_order.telephone_number = " "
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が９桁の場合' do
        @purchased_order.telephone_number = 123456789
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end
      it '電話番号が12桁の場合' do
        @purchased_order.telephone_number = 123456789012
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end
      it '電話番号にハイフンがある場合' do
        @purchased_order.telephone_number = "123-1234-1234"
        @purchased_order.valid?
        expect(@purchased_order.errors.full_messages).to include("Telephone number is not a number")
      end
    end
  end
end
