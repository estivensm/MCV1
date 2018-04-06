namespace :email do
  desc "Sends the most voted products created yesterday"
  task vencimiento: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
    Report.where(state: "Abierto").each do |report|
        
        employed = Employed.find(report.employed_id)    
        times = report.f_compromiso.to_time
        time =  times.to_i - Time.now.to_i
        report.contador_seg = (time / 60 / 60/ 24) + 1

            if report.contador_seg < 5 && report.contador_seg > 0
            
            AlertaMailer.vencimiento_report(employed,report, "proximo").deliver
            
        elsif report.contador_seg < 0

            AlertaMailer.vencimiento_report(employed,report, "vencido").deliver

        elsif report.contador_seg == 0

            AlertaMailer.vencimiento_report(employed,report, "hoy").deliver

        end




        
        times1 = report.fp_seguimiento.to_time
        time1 =  times1.to_i - Time.now.to_i
        m = (time1 / 60 / 60/ 24) + 1
        report.tag = false
        report.save
        
        if m < 0
           
            AlertaMailer.seguimiento_report(employed,report, "vencida").deliver
                
        elsif m == 0
            AlertaMailer.seguimiento_report(employed,report, "hoy").deliver


        end
       

    end 

    Accion.where(estado: "Abierta").each do |accion|
        employed = Employed.find(accion.employed_id)    
        times = accion.f_compromiso.to_time
        time =  times.to_i - Time.now.to_i
        accion.contador_seg = (time / 60 / 60/ 24) + 1
        accion.save
        

        if accion.contador_seg < 5 && accion.contador_seg > 0
            
            AlertaMailer.vencimiento_accion(employed,accion,"proxima").deliver
            
        elsif accion.contador_seg < 0

            AlertaMailer.vencimiento_accion(employed,accion, "vencida").deliver

        elsif accion.contador_seg == 0

            AlertaMailer.vencimiento_accion(employed,accion, "hoy").deliver

        end

     

     if accion.f_seguimiento != 0           
        times1 = accion.fp_seguimiento.to_time
        time1 =  times1.to_i - Time.now.to_i
        m = (time1 / 60 / 60/ 24) + 1
        accion.tag = false
        accion.save
        
        if m < 0 
           
        AlertaMailer.seguimiento_accion(employed,accion, "vencida").deliver

    elsif m == 0
        AlertaMailer.seguimiento_accion(employed,accion, "hoy").deliver

            
            end
      end

    end 


      Task.where(estado: false).each do |task|
        employed = Employed.find(task.employed_id)    
        times = task.f_compromiso.to_time
        time =  times.to_i - Time.now.to_i
        task.contador_seg = (time / 60 / 60/ 24) + 1
        task.save
        puts task.contador_seg

        if task.contador_seg < 5 && task.contador_seg > 0
            
          AlertaMailer.vencimiento_task(employed,task,"proxima").deliver
            
        elsif task.contador_seg < 0

          AlertaMailer.vencimiento_task(employed,task, "vencida").deliver

        elsif task.contador_seg == 0

          AlertaMailer.vencimiento_task(employed,task, "hoy").deliver

        end

                 
      


    end 
end
  end




       