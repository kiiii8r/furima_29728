FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    first_name_kana {Gimei.last.katakana}
    last_name_kana {Gimei.first.katakana}
    birthday {Faker::Date.birthday}
  end
end