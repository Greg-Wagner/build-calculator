# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PriceDatum.all.each { |d| d.destroy} 
Output.all.each { |p| p.destroy} 


PriceDatum.create(location: "N/A", adjusted_low_lot: 0, adjusted_high_lot: 0)
PriceDatum.create(location: "Oceanside", adjusted_low_lot: 50555.5, adjusted_high_lot: 203143.709)
PriceDatum.create(location: "Encinitas", adjusted_low_lot: 1111111, adjusted_high_lot: 2222222)
PriceDatum.create(location: "Del Mar", adjusted_low_lot: 1232534, adjusted_high_lot: 3456754)
PriceDatum.create(location: "Rancho Santa Fe", adjusted_low_lot: 23434, adjusted_high_lot: 45466)

