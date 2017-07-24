class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
    @companies = Company.my_company(current_user.id, params[:page])
  end

  def show
    @company = Company.find(params[:id])
    @jobs = Job.comp_jobs(@company.id, params[:page])
    @count = Job.comp_jobs_count(@company.id)
    @pending = Job.comp_pending_count(@company.id)
    @campaings = Boostcampaing.boost_campaing_list( current_user.id , params[:page])
  end

end
