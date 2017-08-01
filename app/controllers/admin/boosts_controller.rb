class Admin::BoostsController < ApplicationController 
	before_action :authenticate_user!
	load_and_authorize_resource
	before_filter :verify_admin
	
	def index
		@boosts = Boost.get_list(params[:page])
		@edited_boosts = Boost.edited_boosts(params[:page])
	end

	def edit
	  	@campaing = Boost.find(params[:id])    
	end

	def update
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

	private
	def verify_admin
	  redirect_to root_url unless current_user.try(:admin?)
	end
end