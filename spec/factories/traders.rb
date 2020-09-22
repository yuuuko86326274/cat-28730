FactoryBot.define do
  factory :trader do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    t_name {'（株）ニャンコ保護'}
    t_postal_code { '111-1111' }
    area_id { Faker::Number.between(from: 1, to: 47)}
    t_city {'横浜市'}
    t_address_num {'下島町5丁目3ー３３'}
    t_building_num {'ビル303'}
    t_tel { Faker::Number.number(digits: 11)}
  end
end
