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
            
            ReportsegMailer.noty_report(employed,report, "proximo").deliver
            
        elsif report.contador_seg < 0

            ReportsegMailer.noty_report(employed,report,"vencido").deliver

        elsif report.contador_seg == 0

            ReportsegMailer.noty_report(employed,report, "hoy").deliver

        end




        
        times1 = report.fp_seguimiento.to_time
        time1 =  times1.to_i - Time.now.to_i
        m = (time1 / 60 / 60/ 24) + 1
        report.tag = false
        report.save
        
        if (m <= 1)
           
            ReportsegMailer.noty_report(employed,report, "segp").deliver
                
        elsif m == 1
            ReportsegMailer.noty_report(employed,report, "segh").deliver

        elsif m < 1

                ReportsegMailer.noty_report(employed,report, "segv").deliver
         end

    end 

    Accion.where(estado: "Abierta").each do |accion|
        employed = Employed.find(accion.employed_id)    
        times = accion.f_compromiso.to_time
        time =  times.to_i - Time.now.to_i
        accion.contador_seg = (time / 60 / 60/ 24) + 1
       
        

        if accion.contador_seg < 5 && accion.contador_seg > 0
            
            AccionsegMailer.noty_accion(employed,accion,"proximo").deliver
            
        elsif accion.contador_seg < 0

            AccionsegMailer.noty_accion(employed,accion, "vencido").deliver

        elsif accion.contador_seg == 0

            AccionsegMailer.noty_accion(employed,accion, "hoy").deliver

        end

                 
        times1 = accion.fp_seguimiento.to_time
        time1 =  times1.to_i - Time.now.to_i
        m = (time1 / 60 / 60/ 24) + 1
        accion.tag = false
        accion.save
        
        if (m <= 1)
           
        AccionsegMailer.noty_accion(employed,accion, "segp").deliver

    elsif m == 1
            AccionsegMailer.noty_accion(employed,accion, "segh").deliver

    elsif m < 1
                AccionsegMailer.noty_accion(employed,accion, "segv").deliver
            
            end


    end 
end
  end




       