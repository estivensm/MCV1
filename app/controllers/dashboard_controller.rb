class DashboardController < ApplicationController
 before_action :authenticate_user!
  def index
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
  	@reports = Report.abiertos.where(employed_id:@employed.id).order(f_compromiso: :asc)
  	@accions = Accion.abiertas.where(employed_id:@employed.id).order(f_compromiso: :asc)
   	@reportspv = Report.abiertos.where(employed_id:@employed.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
  	@accionspv = Accion.abiertas.where(employed_id:@employed.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
  	@reportsv = Report.abiertos.where(employed_id:@employed.id).where("contador_seg < ?", 0)
  	@accionsv = Accion.abiertas.where(employed_id:@employed.id).where("contador_seg < ?", 0)
    @reportsvi = Report.abiertos.where(employed_id:@employed.id).where("contador_seg > ? ", 5) 
    @accionsvi = Accion.abiertas.where(employed_id:@employed.id).where("contador_seg > ?", 5)

  
  end

  def asignados_d
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @reports = Report.abiertos.where(employed_id:@employed.id).where("contador_seg <= ?", 5).order(f_compromiso: :asc)
    @accions = Accion.abiertas.where(employed_id:@employed.id).where("contador_seg <= ?", 5).order(f_compromiso: :asc)
    @reportspv = Report.abiertos.where(employed_id:@employed.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
    @accionspv = Accion.abiertas.where(employed_id:@employed.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
    @reportsv = Report.abiertos.where(employed_id:@employed.id).where("contador_seg < ?", 0)
    @accionsv = Accion.abiertas.where(employed_id:@employed.id).where("contador_seg < ?", 0)
 

    @iemployed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @ireports = Report.abiertos.where(employed_reporta:@employed.id).where("contador_seg <= ?", 5).order(f_compromiso: :asc)
    @iaccions = Accion.abiertas.where(user_id: current_user.id).where("contador_seg <= ?", 5).order(f_compromiso: :asc)
    @ireportspv = Report.abiertos.where(employed_reporta:@employed.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
    @iaccionspv = Accion.abiertas.where(user_id: current_user.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
    @ireportsv = Report.abiertos.where(employed_reporta:@employed.id).where("contador_seg < ?", 0)
    @iaccionsv = Accion.abiertas.where(user_id: current_user.id).where("contador_seg < ?", 0)
  end

  def invitado_d
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @reports = @employed.reports.where("contador_seg <= ?", 5).order(f_compromiso: :asc)
    @accions = @employed.accions.where(employed_id:@employed.id).where("contador_seg <= ?", 5).order(f_compromiso: :asc)
    @reportspv = @employed.reports.where(employed_id:@employed.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
    @accionspv = @employed.accions.where(employed_id:@employed.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
    @reportsv = @employed.reports.where(employed_id:@employed.id).where("contador_seg < ?", 0)
    @accionsv = @employed.accions.where(employed_id:@employed.id).where("contador_seg < ?", 0)
 

    @iemployed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @ireports = @employed.reports.where(employed_reporta:@employed.id).where("contador_seg <= ?", 5).order(f_compromiso: :asc)
    @iaccions = @employed.accions.where(user_id: current_user.id).where("contador_seg <= ?", 5).order(f_compromiso: :asc)
    @ireportspv = @employed.reports.where(employed_reporta:@employed.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
    @iaccionspv = @employed.accions.where(user_id: current_user.id).where("contador_seg <= ? AND contador_seg >= ? ", 5,0)
    @ireportsv = @employed.reports.where(employed_reporta:@employed.id).where("contador_seg < ?", 0)
    @iaccionsv = @employed.accions.where(user_id: current_user.id).where("contador_seg < ?", 0)
  end




end

