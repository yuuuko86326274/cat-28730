require 'rails_helper'

RSpec.describe Cat, type: :model do
  before do
    @trader = FactoryBot.create(:trader)
    @cat = FactoryBot.build(:cat, images: fixture_file_upload('spec/fixtures/files/test_image.png'), trader_id: @trader.id)
  end

  describe '猫登録情報の保存' do
    context '登録がうまくいくとき' do
      it '全ての値が正しく入力されていたら保存できること' do
        expect(@cat).to be_valid
      end

      it 'priceの範囲が、半角数字の入力で、¥1000〜¥9,999,999だと保存できること' do
        @cat.price
        expect(@cat).to be_valid
      end

      it 'priceがなくても保存できること' do
        @cat.price = nil
        expect(@cat).to be_valid
      end

      it 'breed_idが---指定でも保存できること' do
        @cat.breed_id = '0'
        expect(@cat).to be_valid
      end

      it 'hair_length_idが---指定でも保存できること' do
        @cat.hair_length_id = '0'
        expect(@cat).to be_valid
      end

      it 'colorが---指定でも保存できること' do
        @cat.color_id = '0'
        expect(@cat).to be_valid
      end

      it 'how_many_idが---指定でも保存できること' do
        @cat.how_many_id = '0'
        expect(@cat).to be_valid
      end

      it 'eye_color_idが---指定でも保存できること' do
        @cat.eye_color_id = '0'
        expect(@cat).to be_valid
      end

      it 'single_idが---指定でも保存できること' do
        @cat.single_id = '0'
        expect(@cat).to be_valid
      end

      it 'senior_idが---指定でも保存できること' do
        @cat.senior_id = '0'
        expect(@cat).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it 'c_nameが空だと保存できないこと' do
        @cat.c_name = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include("C name can't be blank")
      end

      it 'c_textが空だと保存できないこと' do
        @cat.c_text = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include("C text can't be blank")
      end

      it 'ope_idが空だと保存できないこと' do
        @cat.ope_id = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Ope can't be blank", 'Ope is not a number')
      end

      it 'sex_idが空だと保存できないこと' do
        @cat.sex_id = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Sex can't be blank", 'Sex is not a number')
      end

      it 'age_idが空だと保存できないこと' do
        @cat.age_id = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Age can't be blank", 'Age is not a number')
      end

      it 'character_idが空だと保存できないこと' do
        @cat.character_id = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Character can't be blank", 'Character is not a number')
      end

      it 'fleas_idが空だと保存できないこと' do
        @cat.fleas_id = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Fleas can't be blank", 'Fleas is not a number')
      end

      it 'veccine_idが空だと保存できないこと' do
        @cat.veccine_id = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Veccine can't be blank", 'Veccine is not a number')
      end

      it 'kuchu_idが空だと保存できないこと' do
        @cat.kuchu_id = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Kuchu can't be blank", 'Kuchu is not a number')
      end

      it 'priceが、¥1000より安いと保存できないこと' do
        @cat.price = '999'
        @cat.valid?
        expect(@cat.errors.full_messages).to include('Price must be greater than or equal to 1000')
      end

      it 'priceが、¥9,999,999より高いと保存できないこと' do
        @cat.price = '10000000'
        @cat.valid?
        expect(@cat.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceは半角数字のみの入力で保存できること' do
        @cat.price = 'だめ'
        @cat.valid?
        expect(@cat.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
