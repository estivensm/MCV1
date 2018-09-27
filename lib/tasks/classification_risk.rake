namespace :classification_risk do
  desc "Sends the most voted products created yesterday"
  task crear: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
        User.all.each do |user|

        	if user.id == user.admin_user
                
                ClassificationRisk.create(user_id: user.id, admin_user: user.id, name: "De Cumplimiento")
                ClassificationRisk.create(user_id: user.id, admin_user: user.id, name: "Operacional")
                ClassificationRisk.create(user_id: user.id, admin_user: user.id, name: "Estratégico")
                ClassificationRisk.create(user_id: user.id, admin_user: user.id, name: "Tecnológico")
                ClassificationRisk.create(user_id: user.id, admin_user: user.id, name: "Legal")
                ClassificationRisk.create(user_id: user.id, admin_user: user.id, name: "Cliente")
                ClassificationRisk.create(user_id: user.id, admin_user: user.id, name: "Financiero")
                ClassificationRisk.create(user_id: user.id, admin_user: user.id, name: "Desastres")
                ClassificationRisk.create(user_id: user.id, admin_user: user.id, name: "Humano")
                ClassificationRisk.create(user_id: user.id, admin_user: user.id, name: "Ambiental")


            end
                
                
            
        end    
    

end
  end