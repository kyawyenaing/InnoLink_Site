class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
     @companies = Company.my_company(current_user.id, params[:page])
  end

  def destroy
    @job = Job.find params[:id]
    @job.destroy

    redirect_to dashboard_path
  end

  def show
    @company = Company.find(params[:id])
    @jobs = Job.comp_jobs(@company.id, params[:page])
  end

end
