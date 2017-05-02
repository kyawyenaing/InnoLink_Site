# file: app/controller/api/v1/sessions_controller.rb
class Api::SessionsController < Devise::SessionsController
  
  respond_to :json

  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
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

  ########################################################################
  #another way to login
  # prepend_before_filter :require_no_authentication, :only => [:create ]

  # before_filter :ensure_params_exist
  # def create
  #   # build_resource
  #   resource = User.find_for_database_authentication(:email => params[:user][:email])
  #   return invalid_login_attempt unless resource

  #   if resource.valid_password?(params[:user][:password])
  #     sign_in("user", resource)
  #     render :json=> {:success=>true, :authentication_token=>resource.authentication_token, :email=>resource.email}
  #   return
  #   end
  #   invalid_login_attempt
  # end

  # def destroy
  #   # sign_out(resource_name)
  #     # warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")

  #     if sign_out(resource_name)
  #     render :status => 200,
  #            :json => { :success => true,
  #                       :info => "Logged out",
  #                       :data => {} }
  #     else
  #       render :json => {:success=>false,:info => "Ma Ya Bue!"}
  #     end

  # end

  # protected

  # def ensure_params_exist
  #   return unless params[:user][:email].blank?
  #   render :json=>{:success=>false, :message=>"missing login email parameter"}, :status=>422
  # end

  # def invalid_login_attempt
  #   warden.custom_failure!
  #   render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  # end

end

