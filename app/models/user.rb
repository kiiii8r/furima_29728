class User < ApplicationRecord
  has_many :products
  has_many :user_products
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
