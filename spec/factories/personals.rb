FactoryBot.define do
  factory :personal do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    # assosiation :user
  end
end
