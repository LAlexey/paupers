FactoryGirl.define do
  factory :user do
    email    { 'hello@example.com' }
    password { 'password' }

    after(:build) { |u| u.skip_confirmation! }
  end
end
