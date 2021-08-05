FactoryBot.define do
  factory :user do
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    birthday               {Faker::Date.between(from: '1930-01-01', to: '2021-08-05')}
  end
end