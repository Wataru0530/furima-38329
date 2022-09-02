require 'rails_helper'

RSpec.describe InformationResidence, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @information_residence = FactoryBot.build(:information_residence, user_id: user.id, product_id: product.id)
    sleep 0.1
  end

  describe '商品購入情報の登録' do
    context '商品購入情報を登録できるとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@information_residence).to be_valid
      end
      it 'buildingは空でも登録できる' do
        @information_residence.building = ''
        expect(@information_residence).to be_valid
      end
    end
  
    context '商品購入情報を登録できないとき' do
      it 'codeが空では登録できない' do
        @information_residence.code = ''
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include("Code can't be blank")
      end
      it 'codeがハイフン無しでは登録できない' do
        @information_residence.code = '1234567'
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include('Code is invalid. Include hyphen(-)')
      end
      it 'codeが半角英数混合では登録できない' do
        @information_residence.code = '111-aaaa'
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include('Code is invalid. Include hyphen(-)')
      end
      it 'codeが全角では登録できない' do
        @information_residence.code = '１２３-４５６７'
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include('Code is invalid. Include hyphen(-)')
      end
      it 'area_idが1では登録できない' do
        @information_residence.area_id = 1
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では登録できない' do
        @information_residence.city = ''
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @information_residence.address = ''
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空では登録できない' do
        @information_residence.phone = ''
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが9桁では登録できない' do
        @information_residence.phone = '090123456'
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが12桁では登録できない' do
        @information_residence.phone = '090123456789'
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが半角英数混合では登録できない' do
        @information_residence.phone = '090aaaa1234'
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが全角では登録できない' do
        @information_residence.phone = '０９０１２３４５６７８'
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include('Phone is invalid')
      end
      it 'tokenが空では保存できない' do
        @information_residence.token = ' '
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できない' do
        @information_residence.user_id = ' '
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空では登録できない' do
        @information_residence.product_id = ' '
        @information_residence.valid?
        expect(@information_residence.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end