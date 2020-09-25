FactoryBot.define do
  factory :comment do
    text    {'kakakakaka'}
    association :user
    association :book
  end
end