namespace :change do
  desc "Sends the most voted products created yesterday"
  task change_task: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
    Task.all.each do |task|
            
            task.codigo = task.codigo[1..5] # new_s = "abcde"
            task.save
    end
    
end
  end