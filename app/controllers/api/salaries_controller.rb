class Api::SalariesController < ApplicationController

  def index
    @salaries = SalaryRange.get_api(params[:name])
  end
  
  def show
    @salary = SalaryRange.find(params[:id])
    render :json=>@salary
  end

end
