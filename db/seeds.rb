# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'l@l.com', password: 'qweasd123', password_confirmation: 'qweasd123')
user.skip_confirmation!


cat = ServiceCategory.create(title: 'cat1', image: Rails.root.join('spec/files/test.jpg').open)
vendor = Vendor.create(name: 'vendor1', description: 'mega useful description', user: user)

service = Service.create(title: 'service1', description: 'mega useful description', price: 100, currency: 'RUB', short_desc: 'desc') do |service|
  service.categories = [cat]
  service.vendor = vendor
end

