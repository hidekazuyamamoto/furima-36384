FactoryBot.define do
  
  factory :purchased_order do
    postal_code{'123-4567'}
    city{'test'}
    address{'test'}
    building_name{'test'}
    telephone_number{"1234567890"}
    area_id{1}
    token{'tok_abcdefghijk00000000000000000'}
  end
end
