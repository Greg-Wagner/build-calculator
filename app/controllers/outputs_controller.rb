class OutputsController < ApplicationController
    require "htmlcsstoimage"
    helper_method :create_image

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

        #Should really refactor this to remove all the repetition

        if @output.location1_min_override == ""
            @output.update(location1_min: PriceDatum.find_by(location: @output.location1).adjusted_low_lot)
        else 
            @output.update(location1_min: @output.location1_min_override)
        end

        if @output.location1_max_override == ""
            @output.update(location1_max: PriceDatum.find_by(location: @output.location1).adjusted_high_lot)
        else
            @output.update(location1_max: @output.location1_max_override)
        end

        if @output.location2_min_override == ""
            @output.update(location2_min: PriceDatum.find_by(location: @output.location2).adjusted_low_lot)
        else 
            @output.update(location2_min: @output.location2_min_override)
        end
        
        if @output.location2_max_override == ""
            @output.update(location2_max: PriceDatum.find_by(location: @output.location2).adjusted_high_lot)
        else
            @output.update(location2_max: @output.location2_max_override)
        end

        if @output.location3_min_override == ""
            @output.update(location3_min: PriceDatum.find_by(location: @output.location3).adjusted_low_lot)
        else 
            @output.update(location3_min: @output.location3_min_override)
        end
        
        if @output.location3_max_override == ""
            @output.update(location3_max: PriceDatum.find_by(location: @output.location3).adjusted_high_lot)
        else
            @output.update(location3_max: @output.location3_max_override)
        end
        
        minimum_land_values = [@output.location1_min, @output.location2_min, @output.location3_min]

        land_min = minimum_land_values.select{|value| OutputsHelper.is_number?(value) == true}.map{|value| value.to_i}.min

        maximum_land_values = [@output.location1_max, @output.location2_max, @output.location3_max]

        land_max = maximum_land_values.select{|value| OutputsHelper.is_number?(value) == true}.map{|value| value.to_i}.max


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
        
        if OutputsHelper.is_number?(@output.total_range_min)
           total_cost_minimum = (@output.build_estimate_min.to_f + @output.total_range_min.to_f).to_s
        else
            total_cost_minimum = @output.build_estimate_min
        end

        if OutputsHelper.is_number?(@output.total_range_min)
            total_cost_maximum = (@output.build_estimate_max.to_f + @output.total_range_max.to_f).to_s
        else
            total_cost_maximum = @output.build_estimate_max
        end

        @output.update(
            total_cost_min: total_cost_minimum,
            total_cost_max: total_cost_maximum)
        
        # redirect_to @output
        create_image
        
    end  


    def create_image

        client = HTMLCSSToImage.new(user_id: ENV["USER_ID"] , api_key: ENV["API_KEY"] )

        html = render_to_string("/outputs/show", formats: :html, layout: false, locals: {output: @output})
        image = client.create_image(html, google_fonts: "Roboto", device_scale: 2)
        redirect_to image.url
    end

    def welcome
        render :welcome
    end

    def image_test
        render '/outputs/image_test'
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
            params.require(:output).permit(:client_name, :sqft, :location1, :location2, :location3, :location1_min_override, :location2_min_override, :location3_min_override, :location1_max_override, :location2_max_override,:location3_max_override, :hcl)
    end

end
