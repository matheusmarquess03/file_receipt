FactoryBot.define do
  factory :sale do
    item
    quantity { 0 }
    association :purchaser, factory: :person
  end
end
