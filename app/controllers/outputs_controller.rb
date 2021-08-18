class OutputsController < ApplicationController
    require "htmlcsstoimage"

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
        puts output_params
        @output.save
        puts @output.hcl
        #Should really refactor this to remove all the repetition
        if @output.location1_min_override == nil
            @output.update(location1_min: PriceDatum.find_by(location: @output.location1).adjusted_low_lot)
        else 
            @output.update(location1_min: @output.location1_min_override)
        end

        if @output.location1_max_override == nil
            @output.update(location1_max: PriceDatum.find_by(location: @output.location1).adjusted_high_lot)
        else
            @output.update(location1_max: @output.location1_max_override)
        end

        if @output.location2_min_override == nil
            @output.update(location2_min: PriceDatum.find_by(location: @output.location2).adjusted_low_lot)
        else 
            @output.update(location2_min: @output.location2_min_override)
        end
        
        if @output.location2_max_override == nil
            @output.update(location2_max: PriceDatum.find_by(location: @output.location2).adjusted_high_lot)
        else
            @output.update(location2_max: @output.location2_max_override)
        end

        if @output.location3_min_override == nil
            @output.update(location3_min: PriceDatum.find_by(location: @output.location3).adjusted_low_lot)
        else 
            @output.update(location3_min: @output.location3_min_override)
        end
        
        if @output.location3_max_override == nil
            @output.update(location3_max: PriceDatum.find_by(location: @output.location3).adjusted_high_lot)
        else
            @output.update(location3_max: @output.location3_max_override)
        end



        land_min = [@output.location1_min, @output.location2_min, @output.location3_min].min
        land_max = [@output.location1_max, @output.location2_max, @output.location3_max].max

        build_min = @output.sqft * 300
        if @output.hcl == 1
        build_max = @output.sqft * 500
        else
        build_max = @output.sqft * 400
        end

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
            total_cost_max: total_cost_maximum)
        
        redirect_to @output
    end

    def create_image
        client = HTMLCSSToImage.new(user_id: , api_key: )

        html = render_to_string("http://localhost:3000/outputs/60", formats: :html, layout: false)
        redirect_to HtmlCssToImage.fetch_url(html: html, google_fonts: "Roboto|Roboto+Condensed"), status: :found
    end

    helper_method :create_image

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
            params.require(:output).permit(:client_name, :sqft, :location1, :location2, :location3, :location1_min_override, :location2_min_override, :location3_min_override, :location1_max_override, :location2_max_override,:location3_max_override, :hcl)
    end

end
