class Api::CitiesController < ApplicationController

  def index
    @cities = City.get_api(params[:name])
  end
  
  def show
    @city = City.find(params[:id])
    render :json=>@city
  end

end
