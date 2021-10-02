class PriceDatum < ApplicationRecord
    require 'csv'
    def self.add_csv_data

        data = CSV.read("/Users/gregwagner/Downloads/costs.csv", headers: true)
        
        data.each do |row|

            location = row[0]
            low = row[1]
            high = row[2]

            PriceDatum.create(location: location, adjusted_low_lot: low, adjusted_high_lot: high)
        end
    end

end