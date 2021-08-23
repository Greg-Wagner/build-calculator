class PriceDataController < ApplicationController
    
    def index
        @price_data = PriceDatum.all
    end

    def new 
        @price_data = PriceDatum.new
    end

    def create
        @price_datum = PriceDatum.new(price_datum_params)
        @price_datum.save
        redirect_to :price_data
    end

    def destroy    
        @price_datum = PriceDatum.find(params[:id])
        @price_datum.destroy
    end

    private

    def price_datum_params
            params.require(:price_datum).permit(:location, :adjusted_low_lot, :adjusted_high_lot)
    end
end
