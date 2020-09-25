FactoryBot.define do
  factory :book do
    name                { 'こんにちは' }
    category_id         { 2 }
    association :user
  end
end
