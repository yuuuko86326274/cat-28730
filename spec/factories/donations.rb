FactoryBot.define do
  factory :donations do
    token {'tok_5ca06b51685e001723a2c3b4aeb4'}
    donation {Faker::Number.between(from: 1000, to: 50000)}
    first_name {'山田'}
    last_name {'太郎'}
    first_pkey {'ヤマダ'}
    last_pkey {'タロウ'}
    postal_code {'111-1111'}
    area_id { Faker::Number.between(from: 1, to: 47)}
    city {'横浜市'}
    address_num {'下島町5ー33'}
    building_num {'ビル209'}
    tel {Faker::Number.number(digits: 11)}
    message {Faker::Lorem.sentence}
    association :cat
    association :personal
    association :trader
  end
end
