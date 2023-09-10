class ApplicationController < ActionController::Base
  	layout :layout_by_resource

  	# for devise: select path to go after login
  	def after_sign_in_path_for(patient_user)
  	  	dashboard_path
  	end

  	private

  	def layout_by_resource
		if devise_controller? && action_name == "new"
			"empty_page"
		else
			"application"
		end
  	end
end
