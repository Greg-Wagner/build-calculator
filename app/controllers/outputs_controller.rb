class OutputsController < ApplicationController
    def index
        @outputs = Output.all
        render :index
    end

    def new 
        @output = Output.new
        @price_data = PriceDatum.all
    end

    def create
        @output = Output.new(output_params)
        @output.save
        @output.update(
            location1_min: PriceDatum.find_by(location: @output.location1).low_lot,
            location1_max: PriceDatum.find_by(location: @output.location1).high_lot,
            location2_min: PriceDatum.find_by(location: @output.location2).low_lot,
            location2_max: PriceDatum.find_by(location: @output.location2).high_lot,
            location3_min: PriceDatum.find_by(location: @output.location3).low_lot,
            location3_max: PriceDatum.find_by(location: @output.location3).high_lot
            # location1_min: PriceDatum.find(@output.location1).low_lot,
            # location1_max: PriceDatum.find(@output.location1).high_lot,
            # location2_min: PriceDatum.find(@output.location2).low_lot,
            # location2_max: PriceDatum.find(@output.location2).high_lot,
            # location3_min: PriceDatum.find(@output.location3).low_lot,
            # location3_max: PriceDatum.find(@output.location3).high_lot
        )

        land_min = [@output.location1_min, @output.location2_min, @output.location3_min].min
        land_max = [@output.location1_max, @output.location2_max, @output.location3_max].max

        build_min = @output.sqft * 5
        build_max = @output.sqft * 10

        @output.update(
        total_range_min: land_min,
        total_range_max: land_max,
        build_estimate_min: build_min,
        build_estimate_max: build_max
        )

        total_cost_minimum = (@output.build_estimate_min + @output.total_range_min)
        total_cost_maximum = (@output.build_estimate_max + @output.total_range_max)

        @output.update(
            total_cost_min: total_cost_minimum,
            total_cost_max: total_cost_maximum
        )

        redirect_to @output
    end

    def show
        @output = Output.find(params[:id])
        render :show
    end

    def destroy    
        @output = Output.find(params[:id])
        @output.destroy
    end

    private

    def output_params
            params.require(:output).permit(:client_name, :sqft, :location1, :location2, :location3)

    end

end
