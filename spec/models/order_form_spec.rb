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
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeに"-"がなければ保存できない' do
        @order_form.post_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが空では保存できない' do
        @order_form.prefecture_id = "0"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'cityが空では保存できない' do
        @order_form.city = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_form.address = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空では保存できない' do
        @order_form.phone = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone can't be blank")
      end
      it 'tokenが空では保存できない' do
        @order_form.token = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end