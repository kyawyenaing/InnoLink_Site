class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
     # @jobs = Job.my_jobs(current_user.id, params[:page])
     @jobs = Job.my_jobs(current_user.id, params[:page])
  end

  def destroy
    @job = Job.find params[:id]
    @job.destroy

    redirect_to jobs_path
  end

end
