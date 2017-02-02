namespace :email do
  desc "Sends the most voted products created yesterday"
  task vencimiento: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
    Report.where(state: "Abierto").each do |report|
            
        @times = report.f_compromiso.to_time
        @time =  @times.to_i - Time.now.to_i  
        report.contador_seg = (@time / 60 / 60/ 24) + 1
        report.save

        
        @times1 = report.fp_seguimiento.to_time
        @time =  @times.to_i - Time.now.to_i  
        m = (@time / 60 / 60/ 24) + 1
        report.save
        
        if (m <= 1)
            employed = Employed.find(report.employed_id)
        SeguimientoMailer.noty_report(employed,report).deliver
            
            end

    end 
    Accion.where(estado: "Abierta").each do |accion|
            
        @times = accion.f_compromiso.to_time
        @time =  @times.to_i - Time.now.to_i  
        accion.contador_seg = (@time / 60 / 60/ 24) + 1
        accion.save
    end 
end
  end




       