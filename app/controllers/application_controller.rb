class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_out_path_for(resource)
  	thanks_path
  end

  def authorize
  	if current_user
	  	unless current_user.email == "vpujji@gmail.com"
	  		redirect_to root_path
	  	end
	else 
		redirect_to root_path
	end
  end

  
end
