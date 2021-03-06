class Api::CompaniesController < ApplicationController

  def index
    @companies = Company.get_list(params[:page])
  end
  
  def show  
    @company = Company.find(params[:id])
    @jobs = Job.comp_jobs(@company.id ,params[:page])    
  end

  def companies_add
  	@company = Company.new
  	@company.name = params["name"]
  	@company.website = params["website"]
  	@company.category_id = params["category_id"].to_i
  	@company.city_id = params["city_id"].to_i
  	@company.address = params["address"]
  	@company.about = params["about"]
  	@company.user_id = params["user_id"].to_i
  	if @company.save
        render :status => 200,
               :json =>{:success => true,
                        :info => "Success!",
                        :data => {:id => @company.id}
                        }
  	else
  	    render :json => @company.errors
  	end 
  end

  def update
    @company = Company.find(params[:id])    
      if @company.update(company_params)
        render json: {message: "Success!"}
      else
        render :json => @company.errors
      end
  end

  private
  def company_params
    params.require(:company).permit(:name, :website, :category_id, :city_id, :address, :about,:user_id)
  end

end
