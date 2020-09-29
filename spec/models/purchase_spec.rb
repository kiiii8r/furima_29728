require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:purchase)
      @product.image = fixture_file_upload('public/images/test_image.png')
    end

    # 購入関連
    it '必須項目を入力した上で購入ができる' do
      expect(@product).to  be_valid
    end

    it '郵便番号がないと登録できない' do
    end

    it '都道府県がないと登録できない' do
    end

    it '市区町村がないと登録できない' do
    end

    it '番地がないと登録できない' do
    end
    it '電話番号がないと登録できない' do
    end

    it '郵便番号に-がないと登録できない' do
    end
    it '電話番号が1桁以内でないと登録できない' do
    end

    it 'がないと登録できない' do
    end
