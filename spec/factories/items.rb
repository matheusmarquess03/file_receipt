FactoryBot.define do
  factory :item do
    association :merchant, factory: :person
    description { "#{Faker::Commerce.price(range: 0..10.0, as_string: true)} off for #{Faker::Commerce.product_name} " }
    price { Faker::Commerce.price }
  end
end
