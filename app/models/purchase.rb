class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one    :address
  attr_accessor :token

  with_options presence: true do
    validates :price
    validates :token
    validates :postal_code, format: { with: /^\d{3}[-]\d{4}$/, message: "Postal code Input correctly" }
    validates :prefecture_id, numericality: { other_than: 0, message: 'select' }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /^(0{1}\d{9,10})$/, message: " "}
  end
end
