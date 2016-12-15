class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    [:account_update,:sign_up].each do |metodo|
    devise_parameter_sanitizer.permit(metodo, keys: [:name,:last_name,:birthday,:document,:document_type,:admin_user,:rol,:avatar,:cargo])
    end
  end

def is_admin?
    if current_user.rol =="SuperAdmin"
      true
    else
      redirect_to root_index_path, alert: 'Tu no eres administrador'
    end
  end

layout :layout_for_selection
protected
  def layout_for_selection
    if controller_name == 'sessions'  || controller_name == 'passwords' 
      'application'
    elsif controller_name == 'registrations'

        if action_name == "new" || action_name == "create"
            'application'
            else
            	'admin'
        end
    	else
      'admin'
    end
  end

end
