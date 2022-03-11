require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end

  describe '購入記録,配送先情報の保存' do
    context '購入記録が保存できる時' do
      it 'item_id、user_id、post_code、prefecture_id、city、address、building、phone、tokenがあれば保存できる' do
        expect(@order_form).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_form.building = ""
        expect(@order_form).to be_valid
      end
    end

    context '購入記録が保存できない時' do
      it 'item_idが空だと保存できない' do
        @order_form.item_id = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include()
      end
      it 'user_idが空だと保存できない' do
        @order_form.item_id = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include()
      end
      it 'post_codeが空では保存できない' do
        @order_form.post_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeに"-"がなければ保存できない' do
        @order_form.post_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号はハイフンを使用してください")
      end
      it 'prefecture_idが空では保存できない' do
        @order_form.prefecture_id = "0"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空では保存できない' do
        @order_form.city = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空では保存できない' do
        @order_form.address = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("番地を入力してください")
      end
      it 'phoneが空では保存できない' do
        @order_form.phone = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phoneが全角では保存できない' do
        @order_form.phone = "０９０１１１１１１１１"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は半角数字で9桁または10桁で入力してください")
      end
      it 'phoneが9桁以下では保存できない' do
        @order_form.phone = "090123456"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は半角数字で9桁または10桁で入力してください")
      end
      it 'phoneが12桁以上では保存できない' do
        @order_form.phone = "090123456789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は半角数字で9桁または10桁で入力してください")
      end
      it 'tokenが空では保存できない' do
        @order_form.token = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("カード情報を入力してください")
      end
    end
  end
end