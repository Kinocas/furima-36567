require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品機能に問題がない場合' do
      it '全てが記入されていれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが¥300~¥9,999,999の間であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品出品機能に問題がある場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it 'status_idが空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it 'fee_burden_idが空では出品できない' do
        @item.fee_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end
      it 'day_idが空では出品できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
      end
      it 'userが空では出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'ユーザーを入力してください'
      end
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it 'status_idが1では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it 'fee_burden_idが1では出品できない' do
        @item.fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end
      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end
      it 'day_idが1では出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it 'priceが¥300以下では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は300以上の値にしてください'
      end
      it 'priceが¥9,999,999以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は9999999以下の値にしてください'
      end
      it 'priceが全角の値では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は数値で入力してください'
      end
      it 'priceが英字の値では出品できない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は数値で入力してください'
      end
      it 'priceが英数字混同の値では出品できない' do
        @item.price = 'abc1000'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は数値で入力してください'
      end
    end
  end
end
