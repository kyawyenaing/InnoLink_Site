class Api::BoostsController < ApplicationController
	before_action :authenticate_user!
	def index
		@boosts = Boost.boost_list( current_user.id , params[:page])
	end

	def edit
	  	@boosted_job = Boost.find(params[:id])    
	end

	def update
	  @boosted_job = Boost.find(params[:id]) 	  
	  	if @boosted_job.user.budget >= params[:boost][:daily_budget].to_i
	  		@boosted_job.boostcampaing.status = 2
	  		@boost.boostcampaing.save
		    if @boosted_job.update(boost_params)	 
		      render json: {message: "Successfully Edited!"}
		    else
		      render :json => @boosted_job.errors
		    end
		else
			render :json => @boosted_job.errors
		end
	end


	private
	def boost_params
		params.require(:boost).permit(:job_id,:boosted_date,:daily_budget,:campaing_id, :user_id)
	end
end
