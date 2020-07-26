FactoryBot.define do

  factory :item do
    image {"6097268976_cec5fc1505_o.jpg"}
    name  {'test'}
    info  {'test_info'}
    category_id {2}
    status_id {2}
    delivery_fee_id {2}
    prefecture_id {2}
    delivery_time_id {2}
  end

end