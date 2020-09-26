FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.characters(16) }
    category_id { Faker::Number.within(range: 1..10) }
    derively_fee_id { Faker::Number.within(range: 1..2) }
    status_id { Faker::Number.within(range: 1..6) }
    prefecture_id { Faker::Number.within(range: 1..47) }
    day_id { Faker::Number.within(range: 1..3) }
    price { Faker::Number.within(range: 300..9999999)  }
    association :user
  end
end