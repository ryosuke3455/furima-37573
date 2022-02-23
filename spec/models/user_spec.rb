require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayがあれば登録できる' do
    end
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない'do
    end
    it '重複したemailが存在する時は登録できない' do
    end
    it 'emailには@がないと登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'passwordは6文字以上かつ、英数字両方ないと登録できない' do
    end
    it 'passwordは確認用と一致していなければ登録できない' do
    end
    it 'last_nameは全角でないと登録できない' do
    end
    it 'first_nameは全角でないと登録できない' do
    end
    it 'last_name_kanaは全角カタカナでないと登録できない' do
    end
    it 'first_name_kanaは全角カタカナでないと登録できない' do
    end
    it 'birthdayが空では登録できない' do
    end
  end
end
