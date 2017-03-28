class CompaniesController < ApplicationController

	def index
		@cities = City.get_list
		@companies = Company.get_list(params[:category_id],params[:city_id],params[:page])
	end

	def new
		@company = Company.new
		@cities = City.get_list
	end

	def create
		@company = Company.new(company_params)
		@user_id = current_user.id
		respond_to do |format|
		  if @company.save
		    format.html { redirect_to companies_path, notice: 'company was successfully created.' }
		  else
		    format.html { render :new }
		  end
		end
	end

	def edit
	  @company = Company.find(params[:id])    
	  @cities = City.get_list
	end

	def update
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

	def destory
	end

	def show
		@company = Company.find(params[:id])
	end

	private
	def company_params
		params. require(:company).permit(:name, :website, :category_id, :city_id, :address, :about)
	end
end
