class Output < ApplicationRecord

    def self.is_number? (input)
        original_number = input
            if input.to_f.to_s == original_number || input.to_i.to_s == original_number
                true
            else
                false
            end
    end


    def self.convert_format (input)
        if Outputs.is_number?(input) == true 
            if input.to_f < 1000000 
                ActionController::Base.helpers.number_to_currency(input.to_f.round(-3) / 1000, precision: 0).to_s + "k"
            else 
                ActionController::Base.helpers.number_to_currency((input.to_f / 1000000).round(2)).to_s + "m"
            end 
        else 
            input
        end 
    end 

end
