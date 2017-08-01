class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_filter :verify_admin
  def index
    @cities = City.get_list
    @jobs = Job.pending_jobs(params[:page])
    @companies = Company.get_list(params[:page])
    @count = Job.get_count(params[:title], params[:category_id],params[:city_id])
    @edited_jobs = Job.edited_jobs(params[:page])
  end

  def edit
    @job = Job.find(params[:id])    
    @city = City.get_list
    @companies = Company.my_company(current_user.id, params[:page])
  end

  def update
    @job = Job.find(params[:id])    
    @job.status = 1
    respond_to do |format|
      if @job.update(job_params)
        flash[:notic] = ""
        format.html { redirect_to admin_jobs_path, notice: 'Job was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find params[:id]
    @job.destroy
    redirect_to admin_jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :company_name, :company_website, :job_type, 
    :category_id, :salary_range_id, :city_id, :description, :requirement, 
    :how_to,:user_id,:company_id,:status)
  end

  private
  def verify_admin
    redirect_to root_url unless current_user.try(:admin?)
  end

end
