require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能について' do
    context '保存される時時' do
      it '正しくかつ漏れなく情報が入力できていれば保存される' do
        expect(@item).to be_valid
      end
    end
    # context '保存されない時' do
    #   it 'imageがないと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    #   it 'nameがないと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    #   it 'explanationがないと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    #   it 'category_idが1だと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    #   it 'status_idが1だと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    #   it 'postage_idが1だと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    #   it 'area_idが1だと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    #   it 'days_idが1だと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    #   it 'priceがないと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    #   it 'priceが300より小さいと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    #   it 'priceが9999999より大きいと保存できない' do
    #     @user. = ""
    #     @user.valid?
    #     expect(@user).to include("")
    #   end
    # end
  end
end
