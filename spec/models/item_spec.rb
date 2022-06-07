require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる時' do
      it '正しく入力し、商品が出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do

      it '商品画像が空ではダメ' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空ではダメ' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がからではダメ' do
        @item.instructions = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Instructions can't be blank")
      end

      it 'カテゴリー選択をしていないとダメ' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態の選択をしていないとダメ' do
        @item.quality_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      
      it '配送料負担の選択をしていないとダメ' do
        @item.deliverycharg_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverycharg can't be blank")
      end

      it '発送元の地域の選択をしていないとダメ' do
        @item.deliveryaddress_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryaddress can't be blank")
      end

      it '発送までの日数の選択をしていないとダメ' do
        @item.deliveryday_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday can't be blank")
      end

      it '価格の入力をしていないとだめ' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は300円以下はだめ' do
        @item.price = '3'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格は9,999,999円以上はだめ' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格は半角数字での入力でないとだめ' do
        @item.price = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is invalid")
      end

    end

  end

end
