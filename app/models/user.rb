class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products

  # ユーザー情報
  validates :nickname, presence: { message: "can't be blank" }
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: "can't be blank" }
  validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'Include both letters and numbers' }, allow_nil: true

  # 本人情報確認
  validates :first_name, presence: { message: "can't be blank" }, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :last_name, presence: { message: "can't be blank" }, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :first_name_kana, presence: { message: "can't be blank" }, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
  validates :last_name_kana, presence: { message: "can't be blank" }, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
  validates :birthday, presence: { message: "can't be blank" }
end
