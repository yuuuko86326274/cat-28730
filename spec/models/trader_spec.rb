require 'rails_helper'

RSpec.describe Trader type: :model do
  before do
    @trader = FactoryBot.build(:trader)
  end

  describe '業者情報の登録' do
    context '保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@trader).to be_valid
      end

      it 'passwordが6文字以上であれば保存できること' do
        @trader.password
        @trader.password_confirmation
        expect(@trader).to be_valid
      end

      it 'building_numは空でも保存できること' do
        @trader.t_building_num = nil
        expect(@trader).to be_valid
      end

      it 't_postal_codeはハイフンが入った郵便番号であれば保存できること' do
        @trader.t_postal_code
        expect(@trader).to be_valid
      end
    end
    context '保存がうまくいかないとき' do
      it 'emailが空では登録できないこと' do
        @trader.email = nil
        @trader.valid?
        expect(@trader.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @trader.save
        another_user = FactoryBot.build(:trader)
        another_user.email = @trader.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できないこと' do
        @trader.password = nil
        @trader.valid?
        expect(@trader.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @trader.password = '00000'
        @trader.password_confirmation = '00000'
        @trader.valid?
        expect(@trader.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @trader.password_confirmation = ''
        @trader.valid?
        expect(@trader.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 't_nameが空だと保存できないこと' do
        @trader.t_name = nil
        @trader.valid?
        expect(@trader.errors.full_messages).to include("T name can't be blank")
      end

      it 't_postal_codeが空だと保存できないこと' do
        @trader.t_postal_code = nil
        @trader.valid?
        expect(@trader.errors.full_messages).to include("T postal code can't be blank")
      end
      it 'area_idが空、もしくは---指定だと保存できないこと' do
        @trader.area_id = '0'
        @trader.valid?
        expect(@trader.errors.full_messages).to include('Area must be other than 0')
      end
      it 't_cityが空だと保存できないこと' do
        @trader.t_city = nil
        @trader.valid?
        expect(@trader.errors.full_messages).to include("T city can't be blank")
      end
      it 't_address_numが空だと保存できないこと' do
        @trader.t_address_num = nil
        @trader.valid?
        expect(@trader.errors.full_messages).to include("T address num can't be blank")
      end
      it 't_telが空だと保存できないこと' do
        @trader.t_tel = nil
        @trader.valid?
        expect(@trader.errors.full_messages).to include("T tel can't be blank")
      end

      it 't_postal_codeが半角数字のハイフン入りの郵便番号でなければ保存できないこと' do
        @trader.t_postal_code = '333jjjj'
        @trader.valid?
        expect(@trader.errors.full_messages).to include('T postal code is invalid')
      end
      it 't_postal_codeが半角数字3桁、ハイフン、半角数字4桁の状態（例：111-1111）でないと保存できないこと' do
        @trader.t_postal_code = '333-jjj'
        @trader.valid?
        expect(@trader.errors.full_messages).to include('T postal code is invalid')
      end
      it 't_telが半角11桁の数字でなければ保存できないこと' do
        @trader.t_tel = '1234567890'
        @trader.valid?
        expect(@trader.errors.full_messages).to include('T tel is invalid')
      end
      it 't_telがハイフン入りでは保存できないこと' do
        @trader.t_tel = '123-456-890'
        @trader.valid?
        expect(@trader.errors.full_messages).to include('T tel is invalid')
      end
    end
  end
end
