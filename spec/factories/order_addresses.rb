FactoryBot.define do
  factory :order_address do
    postal_code { "123-4567" }
    prefecture_id { 34 }
    city { "バビロニア"}
    street { "1-1-1" }
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}

    association :user_id
    association :item_id
  end
end
