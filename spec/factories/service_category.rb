FactoryGirl.define do
  factory :service_category do
    title { Faker::Name.title }
    image { Rails.root.join('spec/files/test.jpg').open }
  end
end
