require 'rails_helper'


RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    #ユーザー情報
    it "nicknameが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user,email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスが@を含む必要があること" do
     
    end

    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが6文字以上であること" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      expect(@user).to be_valid?
    end

    it "パスワードは半角英数字混合であること" do
    
    end

    it "パスワードが5文字以下では登録できないこと" do
      @user.password ="aaaaa"
      @user.password_confirmation = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
   
    it "新規登録・ログイン共にエラーハンドリングができていること" do
      @user.password ="aaaaa"
      @user.password_confirmation = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  
    #本人情報確認
    it "ユーザー本名が、名字と名前がそれぞれ必須であること" do
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
    end

    it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
    end

    it "生年月日が必須であること" do
      # @user.birthday = nil
      # @user.valid?
      # binding.pry
      # expect(@user.errors.full_messages).to include("")
    end


  end
end
