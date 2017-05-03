# file: app/controller/api/v1/sessions_controller.rb
class Api::SessionsController < Devise::SessionsController
  
  respond_to :json

  def create
    warden.authenticate(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => { :success => true,
                      :info => "Login Success!",
                      :data => { :authentication_token => current_user.authentication_token ,
                                 :id => current_user.id
                                } 
                    }
  end

  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    current_user.update_column(:authentication_token, nil)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
  end

  def failure
    render :status => 200,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end


end

