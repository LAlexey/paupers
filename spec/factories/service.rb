FactoryGirl.define do
  factory :service do
    vendor
    title 'Название'
    description 'Описание'
    price { 100 }
    currency { 'RUB' }
    short_desc { 'desc asds' }

    after(:build) do |service|
      service.categories = build_list(:service_category, 1)
    end
  end
end
