FactoryBot.define do
  factory :user do
    nickname              { 'k_test' }
    email                 { 'sample@sample.com' }
    password              { 'aaa111' }
    password_confirmation { 'aaa111' }
    family_name           { '小川' }
    first_name            { '健一郎' }
    family_name_kana      { 'オガワ' }
    first_name_kana       { 'ケンイチロウ' }
    birthday              { '1990-10-21' }
  end
end
