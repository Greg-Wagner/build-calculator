module ApplicationHelper
    def convert_format (input)
        orginal_number = input
        if input.to_f.to_s == original_number 
            if input.to_f < 1000000 
                (number_to_currency((input.to_f.round(-3) / 1000), precision: 0) + "k").to_s 
            else 
                (number_to_currency((input / 1000000).to_f.round(2), precision: 2) + "m").to_s
            end 
        else 
        input
        end 
    end
end
