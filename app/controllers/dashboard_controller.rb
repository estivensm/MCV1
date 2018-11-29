class DashboardController < ApplicationController
 before_action :authenticate_user!
 include ApplicationHelper
  
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


    @accions_all = Accion.abiertas.where(employed_id:@employed.id).alerta1
  	@accions = @accions_all.order(f_compromiso: :asc)
  	@accionspv = @accions_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
  	@accionsv = @accions_all.where("contador_seg < ?", 0).count
    @accionsvi = @accions_all.where("contador_seg > ?", 5).count

    @tasks_all = Task.abiertas.where(employed_id:@employed.id).alerta
    @tasks = @tasks_all.order(f_compromiso: :asc)
    @taskspv = @tasks_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @tasksv = @tasks_all.where("contador_seg < ?", 0).count
    @tasksvi = @tasks_all.where("contador_seg > ? ", 5).count

     
    @report_array = []
    @accion_array = []
    @task_array = []
    report_accions_seguimiento = []
    report_accions_tareas = []
    report_array_r = []
    report_array_e = []
    accion_array_e = []
    task_array_e = []
    report_state = {"report" => false, "accion" => false, "task" => false }
    

    @reportss = Report.abiertos.where(admin_user: current_user.admin_user).order(id: :asc)

    Report.abiertos.where(admin_user: current_user.admin_user).order(id: :asc).each do |report|
      puts report.id
      puts estado_alerta(report.contador_seg)
      if report.employed.email == current_user.email && (estado_alerta(report.contador_seg) == "vencido" || estado_alerta(report.contador_seg) == "proximo" )
            
            puts "1"
            @report_array << {"cierre"=>true, "id"=>report.id}
      else
            puts "2"
            @report_array << {"cierre"=>false, "id"=>report.id}
      end 

      
      if report.accions.abiertas.where(employed: @employed.id).alerta1.count > 0 #&& !report_state["report"]
        puts "3"
        @accion_array << {"cierre"=>true}
        #report_array_r << report 
        #report_state["accion"] = true
      else
        puts "4"
        @accion_array << {"cierre"=>false}

      end 
      
      task_t = false
      report.accions.abiertas.each do |accion|
          

          if accion.tasks.abiertas.where(employed: @employed.id).alerta.count > 0 #&& !report_state["accion"]
            
             task_t = true
            
          else
        

          end

      end
       
       @task_array << {"cierre" => task_t}
       


      end

    puts "arraaaaaaaaayyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
    puts @report_array

   

  end




  def index_person
  
      
    @report_array = []
    @accion_array = []
    @task_array = []
    report_accions_seguimiento = []
    report_accions_tareas = []
    report_array_r = []
    report_array_e = []
    accion_array_e = []
    task_array_e = []
     

    @employed = Employed.find(params[:id])

    @reportss = Report.abiertos.where(admin_user: current_user.admin_user).order(id: :asc)

    Report.abiertos.where(admin_user: current_user.admin_user).order(id: :asc).each do |report|
      puts report.id
      puts estado_alerta(report.contador_seg)
      if report.employed.email == @employed.email && (estado_alerta(report.contador_seg) == "vencido" || estado_alerta(report.contador_seg) == "proximo" )
            
            puts "1"
            @report_array << {"cierre"=>true, "id"=>report.id}
      else
            puts "2"
            @report_array << {"cierre"=>false, "id"=>report.id}
      end 

      
      if report.accions.abiertas.where(employed: @employed.id).alerta1.count > 0 #&& !report_state["report"]
        puts "3"
        @accion_array << {"cierre"=>true}
        #report_array_r << report 
        #report_state["accion"] = true
      else
        puts "4"
        @accion_array << {"cierre"=>false}

      end 
      
      task_t = false
      report.accions.abiertas.each do |accion|
          

          if accion.tasks.abiertas.where(employed: @employed.id).alerta.count > 0 #&& !report_state["accion"]
            
             task_t = true
            
          else
        

          end

      end
       
       @task_array << {"cierre" => task_t}
       


      end

      

   

  end

  def asignados_d
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first


    @reports_all = Report.abiertos.where(employed_reporta:@employed.id)
    @reports =   @reports_all.order(f_compromiso: :asc).alerta
    @reportspv = @reports_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @reportsv =  @reports_all.where("contador_seg < ?", 0).count
    @reportsvi = @reports_all.where("contador_seg > ? ", 5).count

    @accions_all = Accion.abiertas.where(user_id: current_user.id)
    @accions = @accions_all.order(f_compromiso: :asc).alerta1
    @accionspv = @accions_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @accionsv = @accions_all.where("contador_seg < ?", 0).count
    @accionsvi = @accions_all.where("contador_seg > ?", 5).count

    @tasks_all = Task.abiertas.where(user_id: current_user.id)
    @tasks = Task.abiertas.where(user_id: current_user.id).order(f_compromiso: :asc).alerta
     @taskspv = @tasks_all.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @tasksv = @tasks_all.where("contador_seg < ?", 0).count
    @tasksvi = @tasks_all.where("contador_seg > ?", 5).count





   
    @accion_array = []
    @report_array = []
    

    @reportss = Report.abiertos.where(admin_user: current_user.admin_user).order(id: :asc)


       
      
       



  end


  def index_seguimiento_person


    @employed = Employed.find(params[:id]) 

    @reportss = Report.abiertos.where(admin_user: current_user.admin_user).order(id: :asc)


       
      
       



  end

  def invitado_d

    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @reports = @employed.reports.abiertos.order(f_compromiso: :asc).alerta
    @reportspv = @employed.reports.abiertos.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @reportsv = @employed.reports.abiertos.where("contador_seg < ?", 0).count
    @reportsvi = @employed.reports.abiertos.where("contador_seg > ?", 5).count

    @accions = @employed.accions.abiertas.order(f_compromiso: :asc).alerta1
    @accionspv = @employed.accions.abiertas.where("contador_seg <= ? AND contador_seg >= ? ", 5,0).count
    @accionsv = @employed.accions.abiertas.where("contador_seg < ?", 0).count
    @accionsvi = @employed.accions.abiertas.where("contador_seg > ?", 5).count



  end

 def pending
    
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @reports_sh = Report.where(employed_id: @employed.id).abiertos.alerta
    @accions_sh = Accion.where(employed_id: @employed.id).abiertas.alerta1
    @tasks_sh = @employed.tasks.abiertas.alerta

 end 


 def employed_indicators



   @todos = []










    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
   
    @reports_sh = Report.where(employed_id: @employed.id).alerta
    @accions_sh = Accion.where(employed_id: @employed.id).alerta1
    @tasks_sh = @employed.tasks.alerta
    
   # @reports_sh.each do |rp|
    #    @todos << {name: rp.description, date: rp.f_compromiso, type: "report"} 
    #end  
    #{}@accions_sh.each do |ac|
    #    @todos << {name: ac.descripcion, date: ac.f_compromiso, type: "accion"}
    #end 
    #@tasks_sh.each do |tk|
     #   @todos << {name: tk.description, date: tk.f_compromiso, type: "tarea"}
    #end





    @reports = Report.where(employed_id: @employed.id)
    @accions = Accion.where(employed_id: @employed.id)
    @tasksd = @employed.tasks

    @reports.abiertos.count != 0 ? @divra = @reports.abiertos.count : @divra = 1
    @accions.abiertas.count != 0 ? @divaa = @accions.abiertas.count : @divaa = 1
    #@accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1
    @tasksd.abiertas.count != 0 ? @divta = @tasksd.abiertas.count : @divta = 1


    @reports.cerrados.count != 0 ? @divr = @reports.cerrados.count : @divr = 1
    @accions.cerradas.count != 0 ? @diva = @accions.cerradas.count : @diva = 1
    #@accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1
    @tasksd.cerradas.count != 0 ? @divt = @tasksd.cerradas.count : @divt = 1



    @rabiertos = @reports.abiertos.count
    @racumplio =    @reports.abiertos.where("contador_seg >= ?" ,1).count
    @ranocumplio =    @reports.abiertos.where("contador_seg < ?" ,1).count
    @rporcentaje_abi_cump =    ((@reports.abiertos.where("contador_seg >= ?" ,1).count.to_f/@divra)*100).to_i
    @rporcentaje_abi_no =    ((@reports.abiertos.where("contador_seg < ?" ,1).count.to_f/@divra)*100).to_i
      


    @rcerrados =    @reports.cerrados.count
    @rcumplio =    @reports.cerrados.where(cumplio: true).count
    @rnocumplio =    @reports.cerrados.where(cumplio: false).count
    @rporcentaje=    ((@reports.cerrados.where(cumplio: true).count.to_f/@divr)*100).to_i
    @rporcentaje_no=    ((@reports.cerrados.where(cumplio: false).count.to_f/@divr)*100).to_i

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
      @aporcentaje_abi_cump = ((@accions.abiertas.where("contador_seg < ?" ,1).count.to_f/ @divaa)*100).to_i
      @aporcentaje_abi_no = (( @accions.abiertas.where("contador_seg >= ?" ,1).count.to_f/ @divaa)*100).to_i




      @acerradas=  @accions.cerradas.count
      @anocumplio =   @accions.cerradas.where(cumplio: false).count
      @acumplio =   @accions.cerradas.where(cumplio: true).count
      @aporcentaje = ((@accions.cerradas.where(cumplio: true).count.to_f/ @diva)*100).to_i
      @aporcentaje_no = ((@accions.cerradas.where(cumplio: false).count.to_f/ @diva)*100).to_i


      @tasks =  @employed.tasks.count
      @tabiertas =  @employed.tasks.abiertas.count
       @tanocumplio =  @employed.tasks.abiertas.vigentes.count
      @tacumplio =  @employed.tasks.abiertas.vencidas.count
      @tporcentaje_abi_cump = ((@employed.tasks.abiertas.where(cumplio: true).count.to_f/@divta)*100).to_i
      @tporcentaje_abi_no = ((@employed.tasks.abiertas.where(cumplio: false).count.to_f/@divta)*100).to_i



      @tcerradas =   @employed.tasks.cerradas.count
      @tnocumplio =  @employed.tasks.cerradas.where(cumplio: false).count
      @tcumplio =  @employed.tasks.cerradas.where(cumplio: true).count
      @tporcentaje = ((@employed.tasks.cerradas.where(cumplio: true).count.to_f/@divt)*100).to_i
      @tporcentaje_no = ((@employed.tasks.cerradas.where(cumplio: false).count.to_f/@divt)*100).to_i





      @total1 = @reports.count + @acciones + @tasks
      @total2 = @racumplio  + @aacumplio + @tacumplio
      @total3 = @ranocumplio  + @aanocumplio + @tanocumplio
      @total4 = @rabiertos + @aabiertas + @tabiertas
      @total5 = @rcumplio  + @acumplio + @tcumplio
      @total6 = @rnocumplio  + @anocumplio + @tnocumplio
      @total7 = @rcerrados + @acerradas + @tcerradas

      @total8 = @total7 == 0 ? ((@total5.to_f/@total7.to_f)*100) : ((@total5.to_f/@total7.to_f)*100).to_i


      
      @total_abiertas_v = @total_abiertas != 0 ? @total_abiertas : 1

      @total_abiertas_cumplio = @racumplio  +  @aacumplio  + @tacumplio
      @total_abiertas_no_cumplio = @ranocumplio + @aanocumplio + @tanocumplio
      @total_abiertas = @total_abiertas_cumplio + @total_abiertas_no_cumplio
      @por_tac = @total_abiertas == 0 ? 0 : ((@total_abiertas_cumplio.to_f/@total_abiertas)*100).to_i
      @por_tanc = @total_abiertas == 0 ? 0 :  ((@total_abiertas_no_cumplio.to_f/@total_abiertas)*100).to_i




  end

end
