class Product < ApplicationRecord
  belongs_to :user
  has_one    :user:user_product
end
