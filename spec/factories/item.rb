FactoryBot.define do

  factory :item do
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
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