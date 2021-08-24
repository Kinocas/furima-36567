require 'rails_helper'

RSpec.describe OrderShopping, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shopping = FactoryBot.build(:order_shopping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shopping).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @order_shopping.building = ''
        expect(@order_shopping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @order_shopping.postal_code = ''
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'prefecture_idが空だと保存できない' do
        @order_shopping.prefecture_id = ''
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空だと保存できない' do
        @order_shopping.city = ''
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと保存できない' do
        @order_shopping.address = ''
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できない' do
        @order_shopping.phone_number = ''
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'user_idが空では保存できない' do
        @order_shopping.user_id = ''
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("ユーザーを入力してください")
      end
      it 'item_idが空では保存できない' do
        @order_shopping.item_id = ''
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("商品を入力してください")
      end
      it 'tokenが空では保存できない' do
        @order_shopping.token = ''
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeに半角ハイフンが正しい位置でないと保存できない' do
        @order_shopping.postal_code = '1234-567'
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("郵便番号が不正な値か、ハイフンが含まれていません")
      end
      it 'postal_codeに半角ハイフンがないと保存できない' do
        @order_shopping.postal_code = '1234567'
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("郵便番号が不正な値か、ハイフンが含まれていません")
      end
      it 'postal_codeに全角数字だと保存できない' do
        @order_shopping.postal_code = '１２３４５６７'
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("郵便番号が不正な値か、ハイフンが含まれていません")
      end
      it 'prefecture_idが1だと保存できない' do
        @order_shopping.prefecture_id = 1
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @order_shopping.phone_number = '0901234'
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが12桁以上保存できない' do
        @order_shopping.phone_number = '090123456789'
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが全角数値だと保存できない' do
        @order_shopping.phone_number = '０９０１２３４５６７８'
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberがハイフンが含まれると保存できない' do
        @order_shopping.phone_number = '090-1234-5678'
        @order_shopping.valid?
        expect(@order_shopping.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end
