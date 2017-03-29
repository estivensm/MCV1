class DashboardController < ApplicationController
 before_action :authenticate_user!
  def index
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
  	@reports = Report.where(employed_id:@employed.id).limit(3).order(f_compromiso: :asc)
  	@accions = Accion.where(employed_id:@employed.id).limit(3).order(f_compromiso: :asc)
  end
end
