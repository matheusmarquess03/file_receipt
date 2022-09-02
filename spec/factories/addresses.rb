FactoryBot.define do
  factory :address do
    person
    street { Faker::Address.street_name}
    number { Faker::Address.building_number }
  end
end
