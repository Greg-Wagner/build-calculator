# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PriceDatum.all.each { |d| d.destroy} 
Output.all.each { |p| p.destroy} 


PriceDatum.create(location: "N/A", average_lot: 0, median_lot: 0, low_lot: 0, high_lot: 0, pp_sqft: 0, under_one_acre_SP: 0, one_to_three_acre_SP: 0, adjusted_low_lot: 0, adjusted_high_lot: 0)
PriceDatum.create(location: "Oceanside", average_lot: 282023, median_lot: 229000, low_lot: 75000, high_lot: 731000, pp_sqft: 5.22, under_one_acre_SP: 272156, one_to_three_acre_SP: 308333, adjusted_low_lot: 50555.5, adjusted_high_lot: 203143.709)
PriceDatum.create(location: "Encinitas", average_lot: 1142933, median_lot: 975000, low_lot: 375000, high_lot: 2050000, pp_sqft: 15.92, under_one_acre_SP: 1154400, one_to_three_acre_SP: 1120000, adjusted_low_lot: 1111111, adjusted_high_lot: 2222222)
PriceDatum.create(location: "Del Mar", average_lot: 1832000, median_lot: 1801500, low_lot: 1225000, high_lot: 2500000, pp_sqft: 118.05, under_one_acre_SP: 1832000, one_to_three_acre_SP: 10000000, adjusted_low_lot: 1232534, adjusted_high_lot: 3456754)
PriceDatum.create(location: "Rancho Santa Fe", average_lot: 1580182, median_lot: 1000000, low_lot: 280000, high_lot: 11000000, pp_sqft: 14.51, under_one_acre_SP: 316000, one_to_three_acre_SP: 1861111, adjusted_low_lot: 23434, adjusted_high_lot: 45466)

