FactoryBot.define do
  sequence :char_name do |n|
    "char##{n}"
  end

  factory :character do
    user
    name { generate(:char_name) }
  end
end
