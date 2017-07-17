class Api::BoostcampaingsController < ApplicationController

	def index
		# render json: {message: "Mingalarbar  !"}
	end
	def new
    	@job = Job.find(params[:job_id])
		@campaing = Boostcampaing.new
	end

	def boost_job
	    # @end = params[:boostcampaing]["end_date(3i)"].to_i
	    # @start = params[:boostcampaing]["start_date(3i)"].to_i
	    # @daily_amount = params[:boostcampaing][:total_budget].to_i
	    # @count = (@end - @start) + 1
	    # @total_budget = @daily_amount * @count
	    # if current_user.budget >= @total_budget
	    # 	@campaing = Boostcampaing.new(campaing_params)
	    #   	@campaing.total_budget = @total_budget
	    #   	current_user.budget -= @total_budget
	    #   	current_user.save
	    #   	if @campaing.save
	    #     	@latest = Boostcampaing.last
	    #     	@i = @latest.start_date
	    #    		while @i <= @latest.end_date do
	    #      		@boost = Boost.new
	    #      		@boost.job_id = @latest.job_id
	    #      		@boost.boosted_date = @i
	    #      		@boost.daily_budget = @daily_amount
	    #      		@boost.save
	    #      		@i += 1
	    #    		end
		   #     	if @boost.save
		   #     	    render json: {message: "Your bost request have been sent !"}
		   #     	else
		   #     	    render :json => @boost.errors
		   #     	end
	    #   	end
	    # else
	    #   render json: {message: "Not Enough Budget !"}
	    # end
	    render json: {message: "Mingalarbar Al Ma Yay !"}
	end


	private
	def campaing_params
		params.require(:boostcampaing).permit(:job_id,:start_date,:end_date,:total_budget)
	end
end
