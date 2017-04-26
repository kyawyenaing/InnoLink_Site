class Api::MycompaniesController < ApplicationController
# before_action :authenticate_user!
  def index
    @jobs = Job.my_job(current_user.id, params[:page])
  end
  
  def show
    @company = Company.find(params[:id])
    @jobs = Job.comp_jobs(@company.id, params[:page])
  end

end
