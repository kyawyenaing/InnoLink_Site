class Api::RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?
  require 'json'
  respond_to :json

  def create
    build_resource(update_sanitized_params)

    if resource.save
      sign_in resource
      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :data => { :user => resource,
                                 :auth_token => current_user.authentication_token },{:id => current_user.id} }
    else
      render :status => 200,
             :json => { :success => false,
                        :info => resource.errors,
                        :data => {} }
    end
  end

  private	
  def update_sanitized_params
  	params.require(:user).permit(:email, :password)
  end
end