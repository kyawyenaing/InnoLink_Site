class Api::JobsController < ApplicationController
    
  # require 'net/http'
  # require 'json'
  def index
    @jobs = Job.get_api(params[:title], params[:city_id])
  end
  
  def show
    @job = Job.find(params[:id])
  end

  def new
    # @job = Job.new()
    # url = 'https://momolay-job.herokuapp.com/api/jobs/new'
    # info = HTTParty.get('https://momolay-job.herokuapp.com/api/jobs/new')
    # data = JSON.parse('info')

    # json = JSON.parse(response.body)
    # @job = Job.new(job_params)
    # @job.title = data["title"]
    # @job.company_name = data["company_name"]
    # @job.company_website = data["company_website"]
    # @job.job_type = data["job_type"]
    # @job.category_id = data["category_id"]
    # @job.salary_range_id = data["salary_range_id"]
    # @job.city_id = data["city_id"]
    # @job.description = data["description"]
    # @job.requirement = data["requirement"]
    # @job.how_to = data["how_to"]
    # respond_to do |format|
    #   if @job.save
    #     format.json { redirect_to jobs_path, notice: 'Job was successfully created.' }
    #   else
    #     format.json { redirect_to new_job_path }
    #   end 
    # end 

    # url = 'https://momolay-job.herokuapp.com/api/jobs/new'
    # uri = URI(url)
    # response = Net::HTTP.get(uri)
    
    # source = 'https://momolay-job.herokuapp.com/api/jobs/new'
    # resp = Net::HTTP.get_response(URI.parse(source))
    # result = resp.body
    # data = JSON.parse(result)

    # @job = Job.new()
    # @job.title = data["title"]
    # @job.company_name = data["company_name"]
    # @job.company_website = data["company_website"]
    # @job.job_type = data["job_type"]
    # @job.category_id = data["category_id"]
    # @job.salary_range_id = data["salary_range_id"]
    # @job.city_id = data["city_id"]
    # @job.description = data["description"]
    # @job.requirement = data["requirement"]
    # @job.how_to = data["how_to"]   
    # @job.user_id = data["user_id"]   
    #   if @job.save
    #     render json: {message: "Success!"}
    #   else
    #     render json: {message: "Failed!"}
    #   end 
    # render json: data["title"]

    # render json: {
    #       status: 200,
    #       message: "Successfully created a job."
    #       # message: data["title"]
    #       object: '{"id":6,"title":"Senior PHP Developer","company_name":"Aries","company_website":"www.aries.com","job_type":"Part-time","category":"IT","salary_range":"100,000 ~ 200,000 ks","city":"Yangon","description":"Senior PHP Developer","requirement":"Senior PHP Developer","how_to":"Senior PHP Developer"}'
    #     }.to_json

    #//it is for heroku test

    @jobs = Job.find(1)
    render json: 
       (@jobs) do |job|
          job.title
          job.company_name
          job.company_website
          job.job_type
          job.category_id
          job.salary_range_id
          job.city_id
          job.description
          job.requirement
          job.how_to
          job.user_id
        end

        # .to_json
    #//it is for heroku test
    

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
