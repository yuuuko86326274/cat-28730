FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.characters(number: 300) }
    association :cat
    association :trader
    association :personal
  end
end
