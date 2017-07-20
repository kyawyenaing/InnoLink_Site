class Admin::BoostcampaingsController < ApplicationController 
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@campaings = Boostcampaing.get_list(params[:page])
		@edited_campaings = Boostcampaing.edited_campaings(params[:page])
	end

	def edit
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
	  	@campaing = Boostcampaing.find(params[:id])    
	end

	def update
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
	  @campaing = Boostcampaing.find(params[:id])    
	  respond_to do |format|
	    if @campaing.update(campaing_params)
	      flash[:notic] = ""
	      format.html { redirect_to admin_boostcampaings_path, notice: 'campaing was successfully updated.' }
	    else
	      format.html { render :edit }
	    end
	  end
	end

	private
	def campaing_params
		params.require(:boostcampaing).permit(:job_id,:start_date,:end_date,:total_budget,:status, :user_id)
	end
end