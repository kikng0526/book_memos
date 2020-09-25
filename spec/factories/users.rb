FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"aaaaa1"}
    password_confirmation {password}
  end
end