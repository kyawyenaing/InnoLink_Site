class Api::JobsController < ApplicationController


  def index
    @jobs = Job.get_list(params[:job_title], params[:city_id], params[:page])
  end
  
  def show
    @job = Job.find(params[:id])
  end
end
