require 'rails_helper'

RSpec.describe Personal, type: :model do
  before do
    @personal = FactoryBot.build(:personal)
  end

  describe 'ユーザー情報の登録' do
    context '保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@personal).to be_valid
      end

      it 'passwordが6文字以上であれば保存できること' do
        @personal.password
        @personal.password_confirmation
        expect(@personal).to be_valid
      end
    end
    context '保存がうまくいかないとき' do
      it 'emailが空では登録できないこと' do
        @personal.email = nil
        @personal.valid?
        expect(@personal.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @personal.save
        another_personal = FactoryBot.build(:personal)
        another_personal.email = @personal.email
        another_personal.valid?
        expect(another_personal.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できないこと' do
        @personal.password = nil
        @personal.valid?
        expect(@personal.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @personal.password = '00000'
        @personal.password_confirmation = '00000'
        @personal.valid?
        expect(@personal.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @personal.password_confirmation = ''
        @personal.valid?
        expect(@personal.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
