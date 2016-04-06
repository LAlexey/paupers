FactoryGirl.define do
  factory :vendor do
    name      { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    user
  end
end
