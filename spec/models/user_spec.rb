require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能' do
    it '記入項目に漏れなく、正しく記入できていれば登録できる' do
    end
    it 'nicknameがなければ保存できない'do
    end
    it 'emailがなければ保存できない' do
    end
    it 'emailが事前に登録されていると保存できない' do
    end
    it 'パスワードが６文字以上でないと保存できない' do
    end
    it 'パスワードは、半角英数字混合でないと保存できない' do
    end
    it 'パスワードとパスワード（確認）は、値の一致でないと保存できない' do
    end
    it 'お名前(全角)は、名字がないと保存できない' do
    end
    it 'お名前(全角)は、名前がないと保存できない' do
    end
    it 'お名前(全角)は、英数字では保存できない' do
    end
    it 'お名前カナ(全角)は、名字がないと保存できない' do
    end
    it 'お名前カナ(全角)は、名前がないと保存できない' do
    end
    it 'お名前カナ(全角)は、全角（カタカナ）以外では保存できない' do
    end
    it '生年月日が無ければ保存できない' do
    end
  end
end
