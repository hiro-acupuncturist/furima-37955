FactoryBot.define do
  factory :user do
    nickname             { Faker::Name.initials(number: 2) }
    email                { Faker::Internet.free_email }
    password             { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    encrypted_password   { password }
    first_name           { Gimei.first.kanji }
    last_name            { Gimei.last.kanji }
    first_name_kana      { Gimei.first.katakana }
    last_name_kana       { Gimei.last.katakana }
    date_of_birth        { Faker::Date.in_date_period }
  end
end
