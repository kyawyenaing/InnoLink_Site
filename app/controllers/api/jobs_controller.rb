class Api::JobsController < ApplicationController

  def index
    @jobs = Job.get_api(params[:title], params[:city_id])
  end
  
  def show
    @job = Job.find(params[:id])
  end

  def new
  	@job = Job.new
  	@cities = City.get_list
  	# redirect_to new_job_path
  end

  def create
  	@job = Job.new(job_params)
  	@job.user_id = current_user.id
  	if @job.save
    redirect_to jobs_path, notice: 'Job was successfully created.'
  	else
    redirect_to new_job_path 
  	end
	end

	def edit
	  @job = Job.find(params[:id])    
	  @city = City.get_list
	  redirect_to edit_job_path
	end

	private
	def job_params
	  params.require(:job).permit(:title, :company_name, :company_website, :job_type, 
	  :category_id, :salary_range_id, :city_id, :description, :requirement, 
	  :how_to,:user_id)
	end


end
