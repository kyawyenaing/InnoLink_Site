class Api::DashboardController < ApplicationController
# before_action :authenticate_user!
  def index
    @companies = Company.my_company(params[:user_id], params[:page])
  end
  
  def show
    @company = Company.find(params[:id])
    @jobs = Job.comp_jobs(@company.id, params[:page])
  end

end
