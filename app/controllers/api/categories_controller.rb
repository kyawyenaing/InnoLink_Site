class Api::CategoriesController < ApplicationController

  def index
    @categories = Category.get_api(params[:name])
  end
  
  def show
    @category = Category.find(params[:id])
    render :json=>@category
  end

end
