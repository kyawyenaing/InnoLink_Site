class HomeCompaniesController < ApplicationController
	def show
		@company = Company.find(params[:id])
		@jobs = Job.comp_jobs(@company.id, params[:page])
		@count = Job.comp_jobs_count(@company.id)
	end

	def edit
		redirect_to root_path
	end
end
