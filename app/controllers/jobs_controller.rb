class JobsController < ApplicationController


  def index
    # @jobs = Job.order(created_at: :DESC).page(params[:page]).per(5)
    # @city = City.order('LOWER(name) ASC')
    @cities = City.get_list
    @jobs = Job.get_list(params[:title], params[:city_id], params[:page])

  end

  def new
    @job = Job.new
    @cities = City.get_list
  end

  def create
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
    @job = Job.find(params[:id])    
    @city = City.get_list
  end

  def update
    @job = Job.find(params[:id])    
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to dashboard_path, notice: 'Job was successfully updated.' }
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

    redirect_to dashboard_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :company_name, :company_website, :job_type, 
    :category_id, :salary_range_id, :city_id, :description, :requirement, 
    :how_to,:user_id)
  end

end
