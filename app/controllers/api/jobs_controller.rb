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
    # url = 'https://momolay-job.herokuapp.com/api/jobs/new'
    # info = HTTParty.get('https://momolay-job.herokuapp.com/api/jobs/new')
    # data = JSON.parse('info')
    # json = JSON.parse(response.body)
    # uri = URI(url)
    # response = Net::HTTP.get(uri)

    # source = 'https://momolay-job.herokuapp.com/api/jobs/new'
    # resp = Net::HTTP.get_response(URI.parse(source))
    # result = resp.body
    # data = JSON.parse(result)
    # render json: data["title"]

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
    # @job.company_id = data["company_id"] 
    #   if @job.save
    #     render json: {message: "Success!"}
    #   else
    #     render json: {message: "Failed!"}
    #   end 

    #//it is for heroku test

    @jobs = Job.find(4)
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
    # @job = Job.new.from_json(params[:job])

    #  respond_to do |format|
    #    if @job.save
    #      format.html  { redirect_to(@job,
    #                    :notice => 'job was successfully created.') }
    #      format.json  { render :json => @job,
    #                    :status => :created, :location => @job }
    #    else
    #      format.html  { render :action => "new" }
    #      format.json  { render :json => @job.errors,
    #                    :status => :unprocessable_entity }
    #    end
    #  end

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
