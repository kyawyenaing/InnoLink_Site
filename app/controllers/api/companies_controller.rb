class Api::CompaniesController < ApplicationController

  def index
    @companies = Company.get_api(params[:name])
  end
  
  def show
    @company = Company.find(params[:id])
    @jobs = Job.where(['company_id = ?', @company.id])
        .order(created_at: :DESC)   
    # @jobs = Job.get_company_job_api(@company.id)
    # render :json=>@company
  end

  def companies_add
  	@company = Company.new
  	@company.name = params["name"]
  	@company.website = params["website"]
  	@company.category_id = params["category_id"].to_i
  	@company.city_id = params["city_id"].to_i
  	@company.address = params["address"]
  	@company.about = params["about"].to_i
  	@company.user_id = params["user_id"].to_i
  	if @company.save
  	    # render json: {message: "Success!"}
        render :status => 200,
               :json =>{ 
                        :success => true,
                        :info => "Success!",
                        :data => {  
                                   :id => @company.id
                                 }
                        }
  	else
  	    render :json => @company.errors
  	end 
  end

end
