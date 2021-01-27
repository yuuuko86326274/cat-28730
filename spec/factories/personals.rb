FactoryBot.define do
  password = Faker::Internet.password(min_length: 6)
  factory :personal do
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
    # assosiation :user
  end
end