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
    context '保存されない時' do
      it 'imageがないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが結びついていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'nameがないと保存できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationがないと保存できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが1だと保存できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが1だと保存できない' do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'postage_idが1だと保存できない' do
        @item.postage_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end
      it 'area_idが1だと保存できない' do
        @item.area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it 'days_idが1だと保存できない' do
        @item.days_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end
      it 'priceがないと保存できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300より小さいと保存できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceが9999999より大きいと保存できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
    end
  end
end
