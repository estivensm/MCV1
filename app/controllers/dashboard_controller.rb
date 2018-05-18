class DashboardController < ApplicationController
 before_action :authenticate_user!
 
  
  def mis_reportesd
      @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
      @reports_all = Report.where(admin_user: current_user.admin_user).abiertos
      @reportspv = @reports_all.proximos.count
      @reportsv = @reports_all.vencidos.count
      @reportsvi = @reports_all.vigentes.count
      @reports = @reports_all.order(f_compromiso: :asc)
  end  


  def index
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first

    @reports_all = Report.abiertos.where(employed_id:@employed.id).abiertos.alerta
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
    @reports = @employed.reports.abiertos.order(f_compromiso: :asc)
    @reportspv = @employed.reports.abiertos.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @reportsv = @employed.reports.abiertos.where("contador_seg < ?", 0).count
    @reportsvi = @employed.reports.abiertos.where("contador_seg > ?", 5).count

    @accions = @employed.accions.abiertas.order(f_compromiso: :asc)
    @accionspv = @employed.accions.abiertas.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @accionsv = @employed.accions.abiertas.where("contador_seg < ?", 0).count
    @accionsvi = @employed.accions.abiertas.where("contador_seg > ?", 5).count



  end


 def employed_indicators
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @reports = Report.where(employed_id: @employed.id)
    @accions = Accion.where(employed_id: @employed.id)
    @tasksd = @employed.tasks
    @reports.cerrados.count != 0 ? @divr = @reports.cerrados.count : @divr = 1
    @accions.cerradas.count != 0 ? @diva = @accions.cerradas.count : @diva = 1
    #@accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1
    @tasksd.cerradas.count != 0 ? @divt = @tasksd.cerradas.count : @divt = 1



    @rabiertos = @reports.abiertos.count
    @racumplio =    @reports.abiertos.where("contador_seg >= ?" ,1).count
    @ranocumplio =    @reports.abiertos.where("contador_seg < ?" ,1).count
    @rcerrados =    @reports.cerrados.count
    @rcumplio =    @reports.cerrados.where(cumplio: true).count
    @rnocumplio =    @reports.cerrados.where(cumplio: false).count
    @rporcentaje=    ((@reports.cerrados.where(cumplio: true).count.to_f/@divr)*100).to_i

    #@correcciones =      @accions.where(tipo: "Correcion").count
    #@canocumplio =     @accions.abiertas.where(tipo: "Correcion").where("contador_seg < ?" ,1).count
    #@cacumplio =    @accions.abiertas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count
    #@cabiertas =      @accions.abiertas.where(tipo: "Correcion").count
    #@ccerradas =     @accions.cerradas.where(tipo: "Correcion").count
    #@cnocumplio =     @accions.cerradas.where(tipo: "Correcion").where("contador_seg < ?" ,1).count
    #@ccumplio =    @accions.cerradas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count
     #@cporcentaje =  ((@accions.cerradas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count.to_f/ @divc)*100).to_i

      @acciones =   @accions.count
      @aabiertas=   @accions.abiertas.count
      @aanocumplio =   @accions.abiertas.where("contador_seg < ?" ,1).count
      @aacumplio =   @accions.abiertas.where("contador_seg >= ?" ,1).count
      @acerradas=  @accions.cerradas.count
      @anocumplio =   @accions.cerradas.where(cumplio: false).count
      @acumplio =   @accions.cerradas.where(cumplio: true).count
      @aporcentaje = ((@accions.cerradas.where(cumplio: true).count.to_f/ @diva)*100).to_i

      @tasks =  @employed.tasks.count
      @tabiertas =  @employed.tasks.abiertas.count
      @tanocumplio =  @employed.tasks.abiertas.where(cumplio: false).count
      @tacumplio =  @employed.tasks.abiertas.where(cumplio: true).count
      @tcerradas =   @employed.tasks.cerradas.count
      @tnocumplio =  @employed.tasks.cerradas.where(cumplio: false).count
      @tcumplio =  @employed.tasks.cerradas.where(cumplio: true).count
      @tporcentaje = ((@employed.tasks.cerradas.where(cumplio: true).count.to_f/@divt)*100).to_i





      @total1 = @reports.count + @acciones + @tasks
      @total2 = @racumplio  + @aacumplio + @tacumplio
      @total3 = @ranocumplio  + @aanocumplio + @tanocumplio
      @total4 = @rabiertos + @aabiertas + @tabiertas
      @total5 = @rcumplio  + @acumplio + @tcumplio
      @total6 = @rnocumplio  + @anocumplio + @tnocumplio
      @total7 = @rcerrados + @acerradas + @tcerradas

      @total8 = @total7 == 0 ? ((@total5.to_f/@total7.to_f)*100) : ((@total5.to_f/@total7.to_f)*100).to_i





  end

end
