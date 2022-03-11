require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品' do
    context '新規出品できるとき' do
      it 'image、name、explanation、category_id、quality_id、delivery_charge_id、pregecture_id、posting_id、priceがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品できないとき' do
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空では出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明が空では出品できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("説明を入力してください")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品の状態が空では出品できない' do
        @item.quality_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '配送料の負担が空では出品できない' do
        @item.delivery_charge_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料を選択してください")
      end
      it '発送元の地域が空では出品できない' do
        @item.prefecture_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県を選択してください")
      end
      it '発送までの日数が空では出品できない' do
        @item.posting_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it '価格が空では出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格が299円以下では出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上9999999以下の半角数字で入力してください")
      end
      it '価格が1000万円以上では出品できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上9999999以下の半角数字で入力してください")
      end
      it '価格が全角入力では出品できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上9999999以下の半角数字で入力してください")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end