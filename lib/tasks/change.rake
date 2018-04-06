namespace :change do
  desc "Sends the most voted products created yesterday"
  task change_task: :environment do
    ReportMailer.noty_report(Employed.last, Report.first).deliver_now
    Task.all.each do |task|
           
           task.codigo = "T" +  task.contador.to_s # new_s = "abcde"
           task.save
   end
   Task.where(estado: true).each do |task|
       @times = task.f_compromiso.to_time
       @time =  @times.to_i - task.f_real.to_time.to_i 
       task.contador_seg = (@time / 60 / 60/ 24) 
         task.f_compromiso >= Time.now.to_date ? (task.cumplio = true) : (task.cumplio = false)
           task.save
    end


    Accion.where(estado: "Cerrada").each do |accion|
      @times = accion.f_compromiso.to_time
       @time =  @times.to_i - accion.f_real.to_time.to_i 
       accion.contador_seg = (@time / 60 / 60/ 24) 
           accion.f_compromiso >= Time.now.to_date ? (accion.cumplio = true) : (accion.cumplio = false)
           accion.save
    end

    Report.where(state: "Cerrado").each do |report|
       @times = report.f_compromiso.to_time
       @time =  @times.to_i - report.f_real.to_time.to_i 
       report.contador_seg = (@time / 60 / 60/ 24) 
           report.f_compromiso >= Time.now.to_date ? (report.cumplio = true) : (report.cumplio = false)
           report.save
    end
    
end
  end