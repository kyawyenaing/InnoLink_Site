class Admin::CompaniesController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
		@cities = City.get_list
		@companies = Company.get_list(params[:page])
		@edited_companies = Company.edited_companies(params[:page])
	end

	def new
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
		@company = Company.new
		@cities = City.get_list
		if !user_signed_in?
		  redirect_to new_user_session_path
		end
	end

	def create
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
		@company = Company.new(company_params)
		@company.user_id = current_user.id
		respond_to do |format|
		  if @company.save
		    format.html { redirect_to dashboard_path, notice: 'company was successfully created.' }
		  else
		    format.html { render :new }
		  end
		end
	end

	def edit
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
	  @company = Company.find(params[:id])    
	  @cities = City.get_list
	end

	def update
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
	  @company = Company.find(params[:id])    
	  respond_to do |format|
	    if @company.update(company_params)
	      flash[:notic] = ""
	      format.html { redirect_to companies_path, notice: 'company was successfully updated.' }
	    else
	      format.html { render :edit }
	    end
	  end
	end

	def show
		if current_user.role_id != 1
			redirect_to new_user_session_path
		end
		@company = Company.find(params[:id])
		@jobs = Job.comp_jobs(@company.id, params[:page])
		@count = Job.comp_jobs_count(@company.id)
	end

	private
	def company_params
		params.require(:company).permit(:name, :website, :category_id, :city_id, :address, :about)
	end
end
