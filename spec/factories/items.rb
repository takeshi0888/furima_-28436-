FactoryBot.define do
  factory :item do
    name            { 'ねこ' }
    explanation     { '里親募集してます。生後２ヶ月です。' }
    genre_id        { '3' }
    status_id       { '2' }
    delivery_fee_id { '2' }
    prefecture_id   { '40' }
    delivery_day_id { '2' }
    price           { '3000' }
    association :user
  end
end
