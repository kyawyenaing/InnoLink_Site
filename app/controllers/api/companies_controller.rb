class Api::CompaniesController < ApplicationController

  def index
    @companies = Company.get_api(params[:name])
  end
  
  def show
    @company = Company.find(params[:id])
    render :json=>@company
  end

end
