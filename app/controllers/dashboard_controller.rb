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


 def employed_indicators
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @reports = Report.where(employed_id: @employed.id)
    @accions = Accion.where(employed_id: @employed.id)
    @tasksd = @employed.tasks
    @reports.cerrados.count != 0 ? @divr = @reports.cerrados.count : @divr = 1  
    @accions.cerradas.where(tipo: "Accion").count != 0 ? @diva = @accions.cerradas.where(tipo: "Accion").count : @diva = 1   
    @accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1 
    @tasksd.cerradas.count != 0 ? @divt = @tasksd.cerradas.count : @divt = 1  
    
      
    
    @rabiertos = @reports.abiertos.count 
    @racumplio =    @reports.abiertos.where("contador_seg >= ?" ,1).count 
    @ranocumplio =    @reports.abiertos.where("contador_seg < ?" ,1).count 
    @rcerrados =    @reports.cerrados.count 
    @rcumplio =    @reports.cerrados.where("contador_seg >= ?" ,1).count 
    @rnocumplio =    @reports.cerrados.where("contador_seg < ?" ,1).count 
    @rporcentaje=    ((@reports.cerrados.where("contador_seg >= ?" ,1).count.to_f/@divr)*100).to_i 
      
    @correcciones =      @accions.where(tipo: "Correcion").count 
    @canocumplio =     @accions.abiertas.where(tipo: "Correcion").where("contador_seg < ?" ,1).count 
    @cacumplio =    @accions.abiertas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count 
    @cabiertas =      @accions.abiertas.where(tipo: "Correcion").count 
    @ccerradas =     @accions.cerradas.where(tipo: "Correcion").count 
    @cnocumplio =     @accions.cerradas.where(tipo: "Correcion").where("contador_seg < ?" ,1).count 
    @ccumplio =    @accions.cerradas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count 
     @cporcentaje =  ((@accions.cerradas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count.to_f/ @divc)*100).to_i 

      @acciones =   @accions.where(tipo: "Accion").count 
      @aabiertas=   @accions.abiertas.where(tipo: "Accion").count 
      @aanocumplio =   @accions.abiertas.where(tipo: "Accion").where("contador_seg < ?" ,1).count 
      @aacumplio =   @accions.abiertas.where(tipo: "Accion").where("contador_seg >= ?" ,1).count 
      @acerradas=  @accions.cerradas.where(tipo: "Accion").count 
      @anocumplio =   @accions.cerradas.where(tipo: "Accion").where("contador_seg < ?" ,1).count 
      @acumplio =   @accions.cerradas.where(tipo: "Accion").where("contador_seg >= ?" ,1).count 
      @aporcentaje = ((@accions.cerradas.where(tipo: "Accion").where("contador_seg >= ?" ,1).count.to_f/ @diva)*100).to_i 
     
      @tasks =  @employed.tasks.count 
      @tabiertas =  @employed.tasks.abiertas.count 
      @tanocumplio =  @employed.tasks.abiertas.where("contador_seg < ?" ,1).count 
      @tacumplio =  @employed.tasks.abiertas.where("contador_seg >= ?" ,1).count 
      @tcerradas =   @employed.tasks.cerradas.count 
      @tnocumplio =  @employed.tasks.cerradas.where("contador_seg < ?" ,1).count 
      @tcumplio =  @employed.tasks.cerradas.where("contador_seg >= ?" ,1).count 
      @tporcentaje = ((@employed.tasks.cerradas.where("contador_seg >= ?" ,1).count.to_f/@divt)*100).to_i
      

     
      

      @total1 = @reports.count + @correcciones + @acciones + @tasks
      @total2 = @racumplio + @cacumplio + @aacumplio + @tacumplio
      @total3 = @ranocumplio + @canocumplio + @aanocumplio + @tanocumplio
      @total4 = @rabiertos + @cabiertas + @aabiertas + @tabiertas
      @total5 = @rcumplio + @ccumplio + @acumplio + @tcumplio
      @total6 = @rnocumplio +@cnocumplio + @anocumplio + @tnocumplio
      @total7 = @rcerrados+ @ccerradas + @acerradas + @tcerradas
      @total8 =((@total5.to_f/@total7.to_f)*100).to_i

   


   
  end

end

