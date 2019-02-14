# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pl1 = ProductLocation.new(name: 'PL1')
pl2 = ProductLocation.new(name: 'PL2')
pl1.save
pl2.save
c1 = Campaign.new(
  name: 'C1',
  campaign_class: Campaign.campaign_classes[:promotion],
  start_date: '2019-01-01',
  end_date: '2019-01-01',
  product_locations: [pl1]
)
c1.save

c11 = Campaign.new(
  name: 'C11',
  campaign_class: Campaign.campaign_classes[:promotion],
  start_date: '2019-01-01',
  end_date: '2019-01-01',
  product_locations: [pl1]
)
c11.save
c2 = Campaign.new(
  name: 'C2',
  campaign_class: Campaign.campaign_classes[:promotion],
  start_date: '2019-02-01',
  end_date: '2019-02-01'
)
c2.save

c3 = Campaign.new(
  name: 'C3',
  campaign_class: Campaign.campaign_classes[:promotion],
  start_date: '2019-03-01',
  end_date: '2019-03-01',
  product_locations: [pl1, pl2]
)
c3.save
