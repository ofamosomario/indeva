class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?

  def layout_by_resource
    if devise_controller? && resource_name == :user
      "devise"
    else
      "application"
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:store_id, :username, :email, :password, :password_confirmation, :full_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:store_id, :username, :password, :password_confirmation, :full_name])
    end  

  private

  	def after_sign_in_path_for(resource)
  	  stores_path
  	end

  	def after_sign_out_path_for(resource_or_scope)
  		new_user_session_path
  	end
end
