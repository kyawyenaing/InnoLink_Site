class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    if current_user.role_id != 1
      redirect_to new_user_session_path
    end
    @cities = City.get_list
    @jobs = Job.pending_jobs(params[:page])
    @companies = Company.get_list(params[:page])
    @count = Job.get_count(params[:title], params[:category_id],params[:city_id])
    @edited_jobs = Job.edited_jobs(params[:page])
  end

  def new
    if current_user.role_id != 1
      redirect_to new_user_session_path
    end
      @job = Job.new
      @cities = City.get_list  
      @companies = Company.my_company(current_user.id, params[:page])   
  end

  def create
    if current_user.role_id != 1
      redirect_to new_user_session_path
    end
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    respond_to do |format|
      if @job.save
        format.html { redirect_to jobs_path, notice: 'Job was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    if current_user.role_id != 1
      redirect_to new_user_session_path
    end
    @job = Job.find(params[:id])    
    @city = City.get_list
    @companies = Company.my_company(current_user.id, params[:page])
  end

  def update
    if current_user.role_id != 1
      redirect_to new_user_session_path
    end
    @job = Job.find(params[:id])    
    @job.status = 1
    respond_to do |format|
      if @job.update(job_params)
        flash[:notic] = ""
        format.html { redirect_to dashboard_path, notice: 'Job was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    if current_user.role_id != 1
      redirect_to new_user_session_path
    end
    @job = Job.find(params[:id])
  end

  def destroy
    if current_user.role_id != 1
      redirect_to new_user_session_path
    end
    @job = Job.find params[:id]
    @job.destroy
    redirect_to dashboard_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :company_name, :company_website, :job_type, 
    :category_id, :salary_range_id, :city_id, :description, :requirement, 
    :how_to,:user_id,:company_id,:status)
  end

end
