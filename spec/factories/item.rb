FactoryBot.define do

  factory :item do
    name  {'test'}
    info  {'test_info'}
    category_id {2}
    status_id {2}
    delivery_fee_id {2}
    prefecture_id {2}
    delivery_time_id {2}
    price {1000}
  end

end