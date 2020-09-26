require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    # 出品情報
    it '全て正しく入力されれば登録できること' do
      expect(@product).to be_valid
    end
  end
end
