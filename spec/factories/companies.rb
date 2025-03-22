
FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Company #{n}" }
    sequence(:number) { |n| "company#{n}@example.com" }
  end
end
