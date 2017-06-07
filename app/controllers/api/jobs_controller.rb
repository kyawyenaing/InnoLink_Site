class Api::JobsController < ApplicationController
  def index
    @jobs = Job.get_list(params[:title], params[:city_id] ,params[:page])
  end
  
  def show
    @job = Job.find(params[:id])
  end

  def jobs_add
    @job = Job.new
    @job.title = params["title"]
    @job.company_name = params["company_name"]
    @job.company_website = params["company_website"]
    @job.job_type = params["job_type"].to_i
    @job.category_id = params["category_id"].to_i
    @job.salary_range_id = params["salary_range_id"].to_i
    @job.city_id = params["city_id"].to_i
    @job.description = params["description"]
    @job.requirement = params["requirement"]
    @job.how_to = params["how_to"]   
    @job.user_id = params["user_id"].to_i
    @job.company_id = params["company_id"].to_i
    if @job.save
        render json: {message: "Successfully Added !"}
    else
        render :json => @job.errors
    end 
  end


    def edit
      @job = Job.find(params[:id])    
      @city = City.get_list
      redirect_to edit_job_path
    end

    def update
      @job = Job.find(params[:id])    
        if @job.update(job_params)
          render json: {message: "Successfully Edited!"}
        else
          render :json => @job.errors
        end
    end

    def destroy
      @job = Job.find params[:id]
      if @job.destroy
        render json: {message: "Successfully Deleted!"}
      else
        render json: {message: "Failed to Delete"}
      end
    end

	private
	def job_params
    params.require(:job).permit(:title, :job_type,:category_id, 
                   :salary_range_id, :city_id, :description, :requirement, 
                   :how_to,:company_id,:status)
	end


end
