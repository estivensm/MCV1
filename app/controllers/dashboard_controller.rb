class DashboardController < ApplicationController
 before_action :authenticate_user!
  def index
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
  	@reports = Report.abiertos.where(employed_id:@employed.id).where("contador_seg <= ?", 5).order(f_compromiso: :asc)
  	@accions = Accion.abiertas.where(employed_id:@employed.id).where("contador_seg <= ?", 5).order(f_compromiso: :asc)
  	@reportspv = Report.abiertos.where(employed_id:@employed.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
  	@accionspv = Accion.abiertas.where(employed_id:@employed.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
  	@reportsv = Report.abiertos.where(employed_id:@employed.id).where("contador_seg < ?", 0)
  	@accionsv = Accion.abiertas.where(employed_id:@employed.id).where("contador_seg < ?", 0)
  end
end

