class Api::DashboardController < ApplicationController
# before_action :authenticate_user!
  def index
    # @companies = Company.my_company(params[:user_id], params[:page])
    @companies = Company.my_company_api(params[:user_id])
  end
  
  def show
    @company = Company.find(params[:id])
    # @jobs = Job.get_comp_job_api(@company.id)
    @jobs = Job.comp_jobs(@company.id, params[:page])
  end

end
