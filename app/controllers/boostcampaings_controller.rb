class BoostcampaingsController < ApplicationController
	before_action :authenticate_user!
	def index
		@campaings = Boostcampaing.boost_campaing_list( current_user.id , params[:page])
	end
	def new
    	@job = Job.find(params[:job_id])
		@campaing = Boostcampaing.new
	end

	def create
	    @end = params[:boostcampaing]["end_date(3i)"].to_i
	    @start = params[:boostcampaing]["start_date(3i)"].to_i
	    @daily_amount = params[:boostcampaing][:total_budget].to_i
	    @count = (@end - @start) + 1
	    @total_budget = @daily_amount * @count
	    if current_user.budget >= @total_budget
	      @campaing = Boostcampaing.new(campaing_params)
	      @campaing.total_budget = @total_budget
	      @campaing.user_id = current_user.id
	      	if @campaing.save
		        @latest = Boostcampaing.last
	        	@i = @latest.start_date
	        	while @i <= @latest.end_date do
	        	  @boost = Boost.new
	        	  @boost.job_id = @latest.job_id
	        	  @boost.boosted_date = @i
	        	  @boost.daily_budget = @daily_amount
	        	  @boost.campaing_id = @latest.id
	        	  @boost.user_id = @latest.user_id
	        	  @boost.save
	        	  @i += 1
	        	end
    	        if @boost.save
    		        respond_to do |format|
    		        flash[:notic] = ""
    		  			format.html { redirect_to boostcampaings_path, notice: 'You have sent boost request.' }
    		  		end
    	      	end     
	      	end
	    else
	      render :text => "Not enough Budget".inspect
	    end
	end

	def edit
	  	@campaing = Boostcampaing.find(params[:id])    
	end

	def update
	  @campaing = Boostcampaing.find(params[:id])    
	  # respond_to do |format|
	    if @campaing.update(campaing_params)	 
	    @jobs = Job.where("id =?", @l_boosts.job_id)   	
	    @boosts = Boost.where("campaing_id =?", @campaing.id)
	    render :text=> @boosts.inspect
	   # @boosts.each do |b|
	   # 	render :text=> @b.inspect
	   # end
	  #     flash[:notic] = ""
	  #     format.html { redirect_to boostcampaings_path, notice: 'campaing was successfully updated.' }
	  #   else
	  #     format.html { render :edit }
	    end
	  # end

	end


	private
	def campaing_params
		params.require(:boostcampaing).permit(:job_id,:start_date,:end_date,:total_budget,:status, :user_id)
	end
end
