class Admin::PanelController < ApplicationController 
	before_action :authenticate_user!
	# load_and_authorize_resource
	def index
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
	end

end