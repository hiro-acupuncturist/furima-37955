require 'rails_helper'

RSpec.describe PurchaserecordDelivery, type: :model do
  describe '商品の購入' do
      before do
        user = FactoryBot.create(:user)
        item = FactoryBot.create(:item)
        @purchaserecord_delivery = FactoryBot.build(:purchaserecord_delivery, user_id: user.id, item_id: item.id)
      end

      context '入力に問題ない場合' do
        it 'すべて正しく入力されて、保存ができている' do
          expect(@purchaserecord_delivery).to be_valid
        end
        it 'buildingは空でも保存できること' do
          @purchaserecord_delivery.building = ''
          expect(@purchaserecord_delivery).to be_valid
        end
  
      end

      context '入力に問題がある場合' do
        it 'postcodeが空では登録できない' do
          @purchaserecord_delivery.postcode = ''
          @purchaserecord_delivery.valid?
          expect(@purchaserecord_delivery.errors.full_messages).to include("Postcode can't be blank", "Postcode is invalid. Include hyphen(-)")
        end  

        it 'deliveryaddress_idを選択していないと登録できない' do
          @purchaserecord_delivery.deliveryaddress_id = 0
          @purchaserecord_delivery.valid?
          expect(@purchaserecord_delivery.errors.full_messages).to include("Deliveryaddress can't be blank")
        end  

        it 'municipalitidsが空では登録できない' do
          @purchaserecord_delivery.municipalitids = ''
          @purchaserecord_delivery.valid?
          expect(@purchaserecord_delivery.errors.full_messages).to include("Municipalitids can't be blank")
        end  

        it 'addressが空では登録できない' do
          @purchaserecord_delivery.address = ''
          @purchaserecord_delivery.valid?
          expect(@purchaserecord_delivery.errors.full_messages).to include("Address can't be blank")
        end  

        it 'telが空では登録できない' do
          @purchaserecord_delivery.tel = ''
          @purchaserecord_delivery.valid?
          expect(@purchaserecord_delivery.errors.full_messages).to include("Tel can't be blank", "Tel PhoneNumber must be 10or11 digit Half-width numbers")
        end  

        it 'telが全角数字では登録できない' do
          @purchaserecord_delivery.tel = '０９０６６３６２３５５'
          @purchaserecord_delivery.valid?
          expect(@purchaserecord_delivery.errors.full_messages).to include("Tel PhoneNumber must be 10or11 digit Half-width numbers")
        end  

        it 'telが10桁以下では登録できない' do
          @purchaserecord_delivery.tel = '111'
          @purchaserecord_delivery.valid?
          expect(@purchaserecord_delivery.errors.full_messages).to include("Tel PhoneNumber must be 10or11 digit Half-width numbers")
        end  

        it 'telが11桁以上では登録できない' do
          @purchaserecord_delivery.tel = '123456789876'
          @purchaserecord_delivery.valid?
          expect(@purchaserecord_delivery.errors.full_messages).to include("Tel PhoneNumber must be 10or11 digit Half-width numbers")
        end  

        it 'postcodeが全角数字では登録できない' do
          @purchaserecord_delivery.postcode = '１２３-４５６６'
          @purchaserecord_delivery.valid?
          expect(@purchaserecord_delivery.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
        end  

        it 'postcodeがハイフンなしでは登録できない' do
          @purchaserecord_delivery.postcode = '1234567'
          @purchaserecord_delivery.valid?
          expect(@purchaserecord_delivery.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
        end  

      end
 end
end
