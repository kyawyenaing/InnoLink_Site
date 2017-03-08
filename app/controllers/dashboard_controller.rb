class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
     @jobs = Job.my_jobs(current_user.id, params[:page])
  end
end
