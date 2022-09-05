FactoryBot.define do
  factory :sale do
    user { User.first || association(:user) }
    item
    quantity { 0 }
    association :purchaser, factory: :person
  end
end
