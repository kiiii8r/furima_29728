require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.build(:product)
      @product.image = fixture_file_upload('public/images/test_image.png')
      @product.save
      @purchase = FactoryBot.build(:purchase_address, product_id: @product.id, user_id: @user.id)
    end
    # 購入関連
    it '必須項目を入力した上で購入ができる' do
      expect(@purchase).to  be_valid
    end

    it '郵便番号がないと登録できない' do
      @purchase.postal_code = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it '都道府県についてのプルダウンが---だと登録できない' do
      @purchase.prefecture_id = 0
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture select')
    end

    it '市区町村がないと登録できない' do
      @purchase.municipality = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地がないと登録できない' do
      @purchase.address = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号がないと登録できない' do
      @purchase.phone_number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it '郵便番号に-がないと登録できない' do
      @purchase.postal_code = '7777777'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postal code Input correctly')
    end
  end
end
