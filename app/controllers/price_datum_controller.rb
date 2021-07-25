class PriceDatumController < ApplicationController
    
    def index
        @price_data = PriceDatum.all
        render :index
    end

    def new 
        @price_data = PriceDatum.new
    end

    def create
        @price_datum = PriceDatum.new(location: params[:location], average_lot: params[:average_lot], median_lot: params[:median_lot], low_lot: params[:low_lot], high_lot: params[:high_lot], PP_sqft: params[:PP_sqft], under_one_acre_SP: params[:under_one_acre_SP], one_to_three_acre_SP: params[:one_to_three_acre_SP])
    end

    def destroy    
        @price_datum = PriceDatum.find(params[:id])
        @price_datum.destroy
    end
end