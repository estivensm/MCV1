namespace :delete do
  desc "Sends the most voted products created yesterday"
    task borrar: :environment do
    #Task para borrar los registros de una Cuenta

    Task.where(admin_user: ENV['admin_user']).destroy_all
    Causa.where(admin_user: ENV['admin_user']).destroy_all    
    Riesgo.where(admin_user: ENV['admin_user']).destroy_all 
    Aseguimiento.where(admin_user: ENV['admin_user']).destroy_all 
    Accion.where(admin_user: ENV['admin_user']).destroy_all 
    Rseguimiento.where(admin_user: ENV['admin_user']).destroy_all 
    Report.where(admin_user: ENV['admin_user']).destroy_all 
    Source.where(admin_user: ENV['admin_user']).destroy_all 
    SourceParent.where(admin_user: ENV['admin_user']).destroy_all 
    Contact.where(admin_user: ENV['admin_user']).destroy_all 
    ClinteProveedor.where(admin_user: ENV['admin_user']).destroy_all 
    Numeral.where(admin_user: ENV['admin_user']).destroy_all 
    Norma.where(admin_user: ENV['admin_user']).destroy_all 
    Rol.where(admin_user: ENV['admin_user']).destroy_all 
    Cargo.where(admin_user: ENV['admin_user']).destroy_all 
    Proceso.where(admin_user: ENV['admin_user']).destroy_all 
    Company.where(user_id: ENV['admin_user']).destroy_all
    User.where(admin_user: ENV['admin_user']).destroy_all 
    Employed.where(admin_user: ENV['admin_user']).destroy_all 


    end

end



