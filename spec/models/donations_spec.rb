require 'rails_helper'

RSpec.describe Donations, type: :model do
  describe '飼育決定情報の保存' do
    before do
      @trader = FactoryBot.create(:trader)
      @cat = FactoryBot.create(:cat, images: fixture_file_upload('/files/test_image.png'), trader_id: @trader.id)
      @personal = FactoryBot.create(:personal)
      @donations = FactoryBot.build(:donations, trader_id: @trader.id, cat_id: @cat.id, personal_id: @personal.id)
    end

    context '保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@donations).to be_valid
      end
      it 'building_numは空でも保存できること' do
        @donations.building_num = nil
        expect(@donations).to be_valid
      end
      it 'postal_codeはハイフンが入った郵便番号であればできること' do
        @donations.postal_code
        expect(@donations).to be_valid
      end

      it 'donationの範囲が、半角数字の入力で、¥1000〜¥9,999,999だと保存できること' do
        @donations.donation = 1000
        expect(@donations).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it 'donationが空だと保存できないこと' do
        @donations.donation = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("Donation can't be blank")
      end

      it 'donationが、¥9,999,999より高いと保存できないこと' do
        @donations.donation = '10000000'
        @donations.valid?
        expect(@donations.errors.full_messages).to include('Donation must be less than or equal to 50000')
      end

      it 'donationは半角数字以外の入力では保存できないこと' do
        @donations.donation = 'だめ'
        @donations.valid?
        expect(@donations.errors.full_messages).to include('Donation is not a number')
      end

      it 'tokenが空だと保存できないこと' do
        @donations.token = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("Token can't be blank")
      end

      it 'first_nameが空では登録出来ないこと' do
        @donations.first_name = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録出来ないこと' do
        @donations.last_name = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが存在してもlast_nameが空では登録できないこと' do
        @donations.last_name = ''
        @donations.valid?
        expect(@donations.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_pkeyが空では登録出来ないこと' do
        @donations.first_pkey = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("First pkey can't be blank")
      end

      it 'last_pkeyが空では登録出来ないこと' do
        @donations.last_pkey = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("Last pkey can't be blank")
      end

      it 'first_pkeyが存在してもlast_pkeyが空では登録できないこと' do
        @donations.last_pkey = ''
        @donations.valid?
        expect(@donations.errors.full_messages).to include("Last pkey can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @donations.postal_code = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角数字のハイフン入りの郵便番号でなければ保存できないこと' do
        @donations.postal_code = '333jjjj'
        @donations.valid?
        expect(@donations.errors.full_messages).to include('Postal code は半角、ハイフンを入れて入力してください')
      end

      it 'postal_codeが半角数字3桁、ハイフン、半角数字4桁の状態（例：111-1111）でないと保存できないこと' do
        @donations.postal_code = '333-jjj'
        @donations.valid?
        expect(@donations.errors.full_messages).to include('Postal code は半角、ハイフンを入れて入力してください')
      end

      it 'area_idが空、もしくは---指定だと保存できないこと' do
        @donations.area_id = '0'
        @donations.valid?
        expect(@donations.errors.full_messages).to include('Area must be other than 0')
      end

      it 'cityが空だと保存できないこと' do
        @donations.city = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("City can't be blank")
      end

      it 'address_numが空だと保存できないこと' do
        @donations.address_num = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("Address num can't be blank")
      end

      it 'telが空だと保存できないこと' do
        @donations.tel = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが半角11桁の数字でなければ保存できないこと' do
        @donations.tel = '1234567890'
        @donations.valid?
        expect(@donations.errors.full_messages).to include('Tel は半角、ハイフンなしで入力してください')
      end

      it 'telがハイフン入りでは保存できないこと' do
        @donations.tel = '123-456-890'
        @donations.valid?
        expect(@donations.errors.full_messages).to include('Tel は半角、ハイフンなしで入力してください')
      end

      it 'messageが空だと保存できないこと' do
        @donations.message = nil
        @donations.valid?
        expect(@donations.errors.full_messages).to include("Message can't be blank")
      end
    end
  end
end
