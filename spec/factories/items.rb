FactoryBot.define do
  factory :item do
    name                 {Faker::Name.name}
    explanation          {"テスト"}
    price                {Faker::Number.bitween(from: 300, to: 9999999)}
    area_id              {Faker::Number.between(from: 2, to: 48)}
    category_id          {Faker::Number.between(from: 2, to: 11)}
    status_id            {Faker::Number.between(from: 2, to: 7)}
    postage_id           {Faker::Number.between(from: 2, to: 3)}
    days_id              {Faker::Number.between(from: 2, to: 4)}
    association :user
  end
end
