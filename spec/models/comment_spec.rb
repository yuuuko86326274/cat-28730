require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @trader = FactoryBot.create(:trader)
    @cat = FactoryBot.create(:cat, images: fixture_file_upload('/files/test_image.png'), trader_id: @trader.id)
    @personal = FactoryBot.create(:personal)
    @comment = FactoryBot.build(:comment, trader_id: @trader.id, cat_id: @cat.id, personal_id: @personal.id)
  end

  describe 'コメントの保存' do
    context '登録がうまくいくとき' do
      it '全ての値が正しく入力されていたら保存できること' do
        expect(@comment).to be_valid
      end

      it 'personalがなくても保存できること' do
        @comment.personal_id = nil
        expect(@comment).to be_valid
      end

      it 'traderがなくても保存できること' do
        @comment.trader_id = nil
        expect(@comment).to be_valid
      end
    end
  end
end
