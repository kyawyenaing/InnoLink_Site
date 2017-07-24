class BoostsController < ApplicationController
	before_action :authenticate_user!
	def index
		@boosts = Boost.boost_list( current_user.id , params[:page])
	end

	def edit
	  	@boost = Boost.find(params[:id])    
	end

	def update
	  @boost = Boost.find(params[:id]) 	  
	  	if @boost.user.budget >= params[:boost][:daily_budget].to_i
	  		@boost.boostcampaing.status = 2
	  		@boost.boostcampaing.save
		  respond_to do |format|
		    if @boost.update(boost_params)	 
		      flash[:notic] = ""
		      format.html { redirect_to boosts_path, notice: 'Your job boosting was successfully updated.' }
		    else
		      format.html { render :edit }
		    end
		  end
		else
			respond_to do |format| 
			flash[:notic] = ""
			format.html { render :edit, notic: 'Your budget is not enough to boost by this daily_budget !!' } 
			end
		end
	end

	private
	def boost_params
		params.require(:boost).permit(:job_id,:boosted_date,:daily_budget,:campaing_id, :user_id)
	end
end
