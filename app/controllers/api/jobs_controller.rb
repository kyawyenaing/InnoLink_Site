class Api::JobsController < ApplicationController
  # require 'HTTParty'
  def index
    @jobs = Job.get_api(params[:title], params[:city_id])
  end
  
  def show
    @job = Job.find(params[:id])
  end

  def new
    # @job = Job.new
    # @cities = City.get_list
  end

  def create
    # url = 'https://momolay-job.herokuapp.com/api/jobs/new'
    # info = HTTParty.get('http://localhost:3000/api/jobs/new')
    # data = JSON.parse('info')
    url = "http://momolay-job.herokuapp.com/api/jobs/new"
    data = JSON.parse(url)
    puts data['title']
    @job = Job.new(job_params)
    @job.title = data["title"]
    @job.company_name = data["company_name"]
    @job.company_website = data["company_website"]
    @job.job_type = data["job_type"]
    @job.category_id = data["category_id"]
    @job.salary_range_id = data["salary_range_id"]
    @job.city_id = data["city_id"]
    @job.description = data["description"]
    @job.requirement = data["requirement"]
    @job.how_to = data["how_to"]
    respond_to do |format|
      if @job.save
        format.json { redirect_to jobs_path, notice: 'Job was successfully created.' }
      else
        format.json { redirect_to new_job_path }
      end 
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
