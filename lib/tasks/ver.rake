namespace :delete do
  desc "Sends the most voted products created yesterday"


#Task para ver los registros de una Cuenta
task ver: :environment do
  
    
    puts "Tareas" + Task.where(admin_user: ENV['admin_user']).count.to_s
    puts "Causas" +  Causa.where(admin_user: ENV['admin_user']).count.to_s    
    puts "Riesgos" + Riesgo.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Aseguimientos" + Aseguimiento.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Acciones" + Accion.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Rseguimientos" + Rseguimiento.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Reportes" +  Report.where(admin_user: ENV['admin_user']).count.to_s
    puts "Tipos" + Source.where(admin_user: ENV['admin_user']).count.to_s
    puts "Fuentes" + SourceParent.where(admin_user: ENV['admin_user']).count.to_s
    puts "Contactos" + Contact.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Clientes" + ClinteProveedor.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Numeral" + Numeral.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Normas" + Norma.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Roles" + Rol.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Cargos" + Cargo.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Procesos" + Proceso.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Empresas" + Company.where(user_id: ENV['admin_user']).count.to_s
    puts "Usuarios" + User.where(admin_user: ENV['admin_user']).count.to_s 
    puts "Empleados" + Employed.where(admin_user: ENV['admin_user']).count.to_s 


    

end

task ver_todos: :environment do
   #Task para ver los registros de la aplicacion
    
    puts "Tareas" + Task.all.count.to_s
    puts "Causas" +  Causa.all.count.to_s    
    puts "Riesgos" + Riesgo.all.count.to_s 
    puts "Aseguimientos" + Aseguimiento.all.count.to_s 
    puts "Acciones" + Accion.all.count.to_s 
    puts "Rseguimientos" + Rseguimiento.all.count.to_s 
    puts "Reportes" +  Report.all.count.to_s
    puts "Tipo" + Source.all.count.to_s
    puts "Fuente" + SourceParent.all.count.to_s
    puts "Contactos" + Contact.all.count.to_s 
    puts "Clientes" + ClinteProveedor.all.count.to_s 
    puts "Numeral" + Numeral.all.count.to_s 
    puts "Normas" + Norma.all.count.to_s 
    puts "Roles" + Rol.all.count.to_s 
    puts "Cargos" + Cargo.all.count.to_s 
    puts "Procesos" + Proceso.all.count.to_s 
    puts "Empresas" + Company.all.count.to_s
    puts "Usuarios" + User.all.count.to_s 
    puts "Empleados" + Employed.all.count.to_s 


    

end

  task empresas: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
        User.where(role: "SuperAdmin").each do |user|
                puts user.company + " " + user.email + " " + user.name + " " + user.admin_user.to_s
                
            
        end    
    

end
  end



