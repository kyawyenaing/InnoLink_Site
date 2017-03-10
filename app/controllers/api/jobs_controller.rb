class Api::JobsController < ApplicationController

  def index
    # @jobs = Job.get_list(params[:title], params[:city_id], params[:page])
    @jobs = Job.get_api(params[:title], params[:city_id])
  end
  
  def show
    @job = Job.find(params[:id])
  end
end
