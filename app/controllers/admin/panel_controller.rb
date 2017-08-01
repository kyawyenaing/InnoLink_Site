class Admin::PanelController < ApplicationController 
	before_action :authenticate_user!
	# load_and_authorize_resource
	before_filter :verify_admin
	def index
	end

	private
	def verify_admin
	  redirect_to root_url unless current_user.try(:admin?)
	end

end