FactoryBot.define do
  sequence :name do |n|
    "user##{n}"
  end

  sequence :email do |n|
    "user##{n}@test.com"
  end

  factory :user do
    name
    email
    password { '123456' }
    password_confirmation { '123456' }

    after(:build) do |user|
      user.skip_confirmation!
    end
  end
end
