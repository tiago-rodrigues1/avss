class ApplicationController < ActionController::Base
  # for devise: select path to go after login
  def after_sign_in_path_for(patient_user)
    dashboard_path
  end
end
