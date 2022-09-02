FactoryBot.define do
  factory :item do
    merchant
    description { "#{Faker::Commerce.price(range: 0..10.0, as_string: true)} off for #{Faker::Commerce.product_name} " }
    price { Faker::Commerce.price }
  end
end
