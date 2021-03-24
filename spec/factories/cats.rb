FactoryBot.define do
  factory :cat do
    c_name { Faker::Lorem.characters(number: 40) }
    c_text { Faker::Lorem.characters(number: 1000) }
    price { Faker::Number.between(from: 1000, to: 50000) }
    breed_id { Faker::Number.between(from: 1, to: 21) }
    ope_id { Faker::Number.between(from: 1, to: 2) }
    sex_id {Faker::Number.between(from: 1, to: 2)}
    age_id {Faker::Number.between(from: 1, to: 5)}
    hair_length_id {Faker::Number.between(from: 1, to: 3)}
    color_id {Faker::Number.between(from: 1, to: 15)}
    how_many_id {Faker::Number.between(from: 1, to: 2)}
    eye_color_id {Faker::Number.between(from: 1, to: 8)}
    character_id {Faker::Number.between(from: 1, to: 7)}
    fleas_id {Faker::Number.between(from: 1, to: 3)}
    veccine_id {Faker::Number.between(from: 1, to: 3)}
    kuchu_id {Faker::Number.between(from: 1, to: 3)}
    single_id {Faker::Number.between(from: 1, to: 2)}
    senior_id {Faker::Number.between(from: 1, to: 2)}
    association :trader
  end
end
