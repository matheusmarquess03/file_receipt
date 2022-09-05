FactoryBot.define do
  factory :user do
    email { 'nuuvem@nuuvem.com.br' }
    password { '123456' }

    trait :with_password_invalid do
      password { nil }
    end
  end
end
