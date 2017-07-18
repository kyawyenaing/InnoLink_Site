class Admin::BoostcampaingsController < ApplicationController 
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@campaings = Boostcampaing.get_list(params[:page])
		@edited_campaings = Boostcampaing.edited_campaings(params[:page])
	end
end