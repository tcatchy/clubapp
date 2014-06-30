class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected	
	 def configure_permitted_parameters
	 	user_params = [:first_name, :last_name, :student_id, :email, :password, :password_confirmation]
	 	club_params = [:name, :description, :website, :reg_no, :president_first_name, :president_last_name,
      :president_contact, :president_email, :treasurer_first_name, :treasurer_last_name, :treasurer_contact, :treasurer_email,
      :admin_first_name,  :admin_last_name, :admin_contact, :email, :nickname, :password, :password_confirmation, :boolean]
 		devise_parameter_sanitizer.for(:sign_up) << user_params
	 	devise_parameter_sanitizer.for(:sign_up) << club_params
	 	club_params << :banner
	 	devise_parameter_sanitizer.for(:account_update) << user_params
	 	devise_parameter_sanitizer.for(:account_update) << club_params
	 end	

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
