FactoryBot.define do
  factory :purchase_delivery_destination do
    postal_code     { '123-4567' }
    prefecture_id   { '2' }
    city            { '東京都'}
    street          { '世田谷区喜多見1-1-1' }
    phone           { '08012345678' }
  end
end
