class RegistrationsController < Devise::RegistrationsController
protected

    def after_update_path_for(resource)
      edit_myself_path(Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first.id)
    end
end