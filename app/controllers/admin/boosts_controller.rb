class Admin::BoostsController < ApplicationController 
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@boosts = Boost.get_list(params[:page])
		@edited_boosts = Boost.edited_boosts(params[:page])
	end

	def edit
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
	  	@campaing = Boost.find(params[:id])    
	end

	def update
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
	  @campaing = Boost.find(params[:id])    
	  respond_to do |format|
	    if @campaing.update(boost_params)
	      flash[:notic] = ""
	      format.html { redirect_to admin_boosts_path, notice: 'campaing was successfully updated.' }
	    else
	      format.html { render :edit }
	    end
	  end
	end

	private
	def boost_params
		params.require(:boost).permit(:job_id,:bosted_date,:daily_budget, :user_id)
	end
end