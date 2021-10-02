# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PriceDatum.all.each { |d| d.destroy} 
Output.all.each { |p| p.destroy} 


# PriceDatum.create(location: "N/A", adjusted_low_lot: 0, adjusted_high_lot: 0)
# PriceDatum.create(location: "Oceanside", adjusted_low_lot: 50555.5, adjusted_high_lot: 203143.709)
# PriceDatum.create(location: "Encinitas", adjusted_low_lot: 1111111, adjusted_high_lot: 2222222)
# PriceDatum.create(location: "Del Mar", adjusted_low_lot: 1232534, adjusted_high_lot: 3456754)
# PriceDatum.create(location: "Rancho Santa Fe", adjusted_low_lot: 23434, adjusted_high_lot: 45466)


data = [
["4S Ranch",1000000,1500000],
["Alpine",150000,250000],
["Bankers Hill",300000,600000],
["Bay Park",600000,800000],
["Black Mountian Ranch - Not an actual neighborhood/zip",800000,1200000],
["Bonita",200000,300000],
["Bonsall",250000,350000],
["Cardiff",600000,1100000],
["Carlsbad",600000,900000],
["Carmel Mountian Ranch",400000,800000],
["Carmel Valley",1000000,1500000],
["Chula Vista",150000,600000],
["Clairemont",600000,800000],
["Coastal",700000,1500000],
["Del Cerro","N/A","N/A"],
["Del Mar",1300000,2200000],
["Del Sur",1500000,2000000],
["East County",150000,500000],
["Eastlake",150000,250000],
["El Cajon",150000,400000],
["Encinitas",650000,1500000],
["Escondido",100000,350000],
["Fallbrook",150000,250000],
["Golden Hill",500000,650000],
["Hidden Meadows",200000,300000],
["Jamul",100000,200000],
["La Jolla",1000000,1500000],
["La Mesa",200000,350000],
["Lemon Grove",200000,600000],
["Lakeside",175000,250000],
["Linda Vista",300000,500000],
["Little Italy","N/A","N/A"],
["Mira Mesa","N/A","N/A"],
["Mission Valley","N/A","N/A"],
["National City",200000,300000],
["Normal Heights",400000,700000],
["North County",200000,400000],
["North Park",200000,500000],
["Ocean Beach",550000,900000],
["Oceanside",250000,500000],
["Olivenhain",600000,900000],
["Otay Ranch",250000,450000],
["Pacific Beach",1000000,1800000],
["Point Loma",700000,1100000],
["Poway",300000,450000],
["Ramona",100000,300000],
["Rancho Bernardo",500000,700000],
["Rancho Pesquitos","N/A","N/A"],
["Rancho Santa Fe",700000,1500000],
["San Marcos",150000,400000],
["San Ysidro","N/A","N/A"],
["Santee",175000,275000],
["Scripps Ranch","N/A","N/A"],
["Serra Mesa","N/A","N/A"],
["Solana Beach",1200000,3000000],
["Sorrento Valley","N/A","N/A"],
["South County",150000,400000],
["Spring Valley",150000,400000],
["Sunset Cliffs","N/A","N/A"],
["Temecula",100000,400000],
["Tierrasanta","N/A","N/A"],
["University City","N/A","N/A"],
["Valley Center",150000,500000],
["Vista",150000,500000],
["Mission Hills",400000,900000],
["Hillcrest",500000,1250000],
["Imperial Beach",350000,1000000]
]

data.sort.each do |row|
    PriceDatum.create(location: row[0], adjusted_low_lot: row[1], adjusted_high_lot: row[2])
end