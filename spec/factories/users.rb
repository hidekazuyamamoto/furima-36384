FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.free_email }
    password               { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    birthday               { Faker::Date.between(from: '1930-01-01', to: '2021-08-05') }
    first_name             { '試験' }
    last_name              { '試験' }
    first_name_kana        { 'シケン' }
    last_name_kana         { 'シケン' }
  end
end
