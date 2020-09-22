class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #ユーザー情報
         validates :nickname, presence: { message: "Nickname can't be blank" }
         validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/,  message: "Email can't be blank" } 
         validates :password, presence: { message: "Password can't be blank" }, confirmation: { message:"Password confirmation doesn't match Password" }, format: { with: /\A[a-z0-9]+\z/i,  message: "Password Include both letters and numbers" } 

        #本人情報確認
         validates :first_name, presence: { message: "First name can't be blank" }, format: { with: /\A[ぁ-んァ-ン一-龥]/ ,message: 'First name Full-width characters' }
         validates :last_name, presence: { message: "Last name can't be blank" }, format: { with: /\A[ぁ-んァ-ン一-龥]/ ,  message: 'Last name Full-width characters' }
         validates :first_name_kana, presence: { message: "First name kana can't be blank"}, format: { with: /\A[ァ-ヶー－]+\z/ ,  message: 'First name kana Full-width katakana characters' }
         validates :last_name_kana, presence: { message:"Last name kana can't be blank" }, format: { with: /\A[ァ-ヶー－]+\z/ ,  message: 'Last name kana Full-width katakana characters' }
         validates :birthday, presence: { message: "Birth date can't be blank" }
end
