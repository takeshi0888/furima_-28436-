require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order_delivery_address)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'token,address1,address2が入力されて、prefecture_idが１以外が入力されて、postal_codeがハイフンを含めて７桁で入力してphone_numberが半角数字１１桁以内で入力されていて、building_nameが空でも購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'prefecture_idが1だと購入できない' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'postal_codeが空だと購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフンを含めて７桁で入力しないと購入できない' do
        @order.postal_code = '12345'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code はハイフンを含めて７桁で入力して下さい')
      end
      it 'address1が空だと購入できない' do
        @order.address1 = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'address2が空だと購入できない' do
        @order.address2 = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address2 can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは半角数字で入力しないと購入できない' do
        @order.phone_number = '全角２３４'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number は11桁以内の半角数字で入力して下さい')
      end
      it 'phone_numberはハイフン不要で１１桁以内で入力しないと購入できない' do
        @order.phone_number = '123456789-123'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number は11桁以内の半角数字で入力して下さい')
      end
    end
  end
end
