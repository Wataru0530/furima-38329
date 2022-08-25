require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.create(:product)
    sleep 0.1
  end


  context '登録ができる時' do
    it '全ての項目の入力が存在すれば登録できること' do
      expect(@product).to be_valid
    end
  end

  context '登録ができない時' do
    it '商品画像を1枚つけることが必須であること' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @product.item_name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Item name can't be blank")
    end

    it '商品の説明が必須であること' do
      @product.info = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Info can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @product.category_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Category is not a number")
    end

    it '商品の状態の情報が必須であること' do
      @product.situation_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Situation is not a number")
    end

    it '配送料の負担の情報が必須であること' do
      @product.cost_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Cost is not a number")
    end

    it '発送元の地域の情報が必須であること' do
      @product.area_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Area is not a number")
    end

    it '発送までの日数の情報が必須であること' do
      @product.day_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Day is not a number")
    end

    it '価格の情報が必須であること' do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it '価格は半角数値のみ保存可能であること' do
      @product.price = '1234567'
      @product.valid?
      expect(@product.errors.full_messages).to include() 
    end

    it '販売価格が¥300より少ない時は出品できないこと' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '販売価格が¥9999999より多い時は出品できないこと' do
      @product.price = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end 

    it 'userが紐づいていないと保存できないこと' do
      @product.user = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('User must exist')
    end
  end
end

