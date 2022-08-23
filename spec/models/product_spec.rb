require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

      context '登録ができる時' do
        it '全ての項目の入力がが存在すれば登録できること' do
          expect(@product).to be_valid
        end

        
        it '価格は半角数値のみ保存可能であること' do
          @product.price = '1234567'
          expect(@product).to be_valid
        end
      end



        context '登録ができない時' do

          it '商品画像を1枚つけることが必須であること' do
            @product.image = ''
            @product.valid?
            expect(@product.errors.full_messages).to include("Image can't be blank")

          it '商品名が必須であること' do
            @product.item_name = ''
            @product.valid?
            expect(@product.errors.full_messages).to include("Item_name can't be blank")
          end
    
          it '商品の説明が必須であること' do
            @product.info = ''
            @product.valid?
            expect(@product.errors.full_messages).to include("Info can't be blank")
          end
    
          it 'カテゴリーの情報が必須であること' do
            @product.category_id = ''
            @product.valid?
            expect(@product.errors.full_messages).to include("Category_id can't be blank")
          end
    
          it '商品の状態の情報が必須であること' do
            @product.situation_id = 'testest'
            @product.valid?
            expect(@product.errors.full_messages).to include("Situation_id can't be blank")
          end
    
          it '配送料の負担の情報が必須であること' do
            @product.cost_id = ''
            @product.valid?
            expect(@product.errors.full_messages).to include("Cost_id can't be blank")
          end
    
          it '発送元の地域の情報が必須であること' do
            @product.area_id = ''
            @product.valid?
            expect(@product.errors.full_messages).to include("Area_id can't be blank")
          end
          
          it '発送までの日数の情報が必須であること' do
            @product.day_id = ''
            @product.valid?
            expect(@product.errors.full_messages).to include("Day_id can't be blank")
          end

          it '価格の情報が必須であること' do
            @product.price = ''
            @product.valid?
            expect(@product.errors.full_messages).to include("Price can't be blank")
          end

          it '販売価格が¥300より少ない時は出品できないこと' do
            @product.price = '299'
            @product.valid?
            expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
          end

          it '販売価格が¥9999999より多い時は出品できないこと' do
            @product.price = '10_000_000'
            @product.valid?
            expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
          end
        end
  end
end
