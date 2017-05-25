class HomeController < ApplicationController

	def index
	  @cities = City.get_list
	  @jobs = Job.get_list(params[:title], params[:city_id], params[:page])
	  @companies = Company.get_list(params[:page])
	  @count = Job.get_count(params[:title],params[:city_id])
	end

	def edit
		redirect_to new_user_session_path
	end

	def show
	  @job = Job.find(params[:id])
	end
end
