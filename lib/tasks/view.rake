namespace :view do
  desc "Sends the most voted products created yesterday"
  task empresas: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
        User.where(role: "SuperAdmin").each do |user|
                puts user.company + " " + user.email + " " + user.name + " " + user.admin_user.to_s
                
            
        end    
    

end
  end