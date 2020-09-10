FactoryBot.define do
  factory :order_delivery_address do
    token { 'PAYJP_PUBLIC_KEY' }
    prefecture_id            { '40' }
    postal_code { '810-0004' }
    address1            { '福岡市' }
    address2            { '中央区渡辺通' }
    phone_number { '09011112222' }
  end
end
