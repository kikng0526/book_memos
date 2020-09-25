FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              {'aaaaa1'}
    password_confirmation {password}
  end
end
