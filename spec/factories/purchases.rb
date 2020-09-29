FactoryBot.define do
  factory :purchase do
    price
    token
    postal_code
    prefecture_id
    municipality
    address
    phone_number
    association :user
  end
end
