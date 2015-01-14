FactoryGirl.define do
  factory :request do
    time { DateTime.current }
    comment { Faker::Lorem.sentence‰(4) }
  end
end
