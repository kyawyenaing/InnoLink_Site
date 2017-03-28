class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
     # @jobs = Job.my_jobs(current_user.id, params[:page])
     @jobs = Job.my_jobs(current_user.id, params[:page])
     @companies = Company.my_company(current_user.id, params[:page])
  end

  def destroy
    @job = Job.find params[:id]
    @job.destroy

    redirect_to dashboard_path
  end

end
