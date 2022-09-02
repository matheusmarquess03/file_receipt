FactoryBot.define do
  factory :sale do
    item
    association :purchaser, factory: :person
  end
end
