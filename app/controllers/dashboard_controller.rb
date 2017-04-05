class DashboardController < ApplicationController
 before_action :authenticate_user!
  def index
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
  	
    @reports_all = Report.abiertos.where(employed_id:@employed.id)  
    @reports = @reports_all.order(f_compromiso: :asc)
    @reportspv = @reports_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @reportsv = @reports_all.where("contador_seg < ?", 0).count
    @reportsvi = @reports_all.where("contador_seg > ? ", 5).count 


    @accions_all = Accion.abiertas.where(employed_id:@employed.id) 
  	@accions = @accions_all.order(f_compromiso: :asc)
  	@accionspv = @accions_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
  	@accionsv = @accions_all.where("contador_seg < ?", 0).count
    @accionsvi = @accions_all.where("contador_seg > ?", 5).count

    @tasks_all = Task.abiertas.where(employed_id:@employed.id)
    @tasks = @tasks_all.order(f_compromiso: :asc)
    @taskspv = @tasks_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @tasksv = @tasks_all.where("contador_seg < ?", 0).count
    @tasksvi = @tasks_all.where("contador_seg > ? ", 5).count 
    

  
  end

  def asignados_d
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    

    @reports_all = Report.abiertos.where(employed_reporta:@employed.id) 
    @reports =   @reports_all.order(f_compromiso: :asc)
    @reportspv = @reports_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @reportsv =  @reports_all.where("contador_seg < ?", 0).count
    @reportsvi = @reports_all.where("contador_seg > ? ", 5).count 

    @accions_all = Accion.abiertas.where(user_id: current_user.id) 
    @accions = @accions_all.order(f_compromiso: :asc)
    @accionspv = @accions_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @accionsv = @accions_all.where("contador_seg < ?", 0).count
    @accionsvi = @accions_all.where("contador_seg > ?", 5).count
    
    @tasks_all = Task.abiertas.where(user_id: current_user.id) 
    @tasks = Task.abiertas.where(user_id: current_user.id).order(f_compromiso: :asc)
     @taskspv = @tasks_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @tasksv = @tasks_all.where("contador_seg < ?", 0).count
    @tasksvi = @tasks_all.where("contador_seg > ?", 5).count

  end

  def invitado_d
     
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @reports = @employed.reports.order(f_compromiso: :asc)
    @reportspv = @employed.reports.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @reportsv = @employed.reports.where("contador_seg < ?", 0).count
    @reportsvi = @employed.reports.where("contador_seg > ?", 5).count

    @accions = @employed.accions.order(f_compromiso: :asc)
    @accionspv = @employed.accions.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @accionsv = @employed.accions.where("contador_seg < ?", 0).count
    @accionsvi = @employed.accions.where("contador_seg > ?", 5).count
 

 
  end




end

