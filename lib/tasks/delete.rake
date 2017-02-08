namespace :delete do
  desc "Sends the most voted products created yesterday"
  task borrar: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
    User.destroy_all
    Company.destroy_all
    Proceso.destroy_all
    Cargo.destroy_all
    Employed.destroy_all
    Norma.destroy_all
    Numeral.destroy_all
    Source.destroy_all
    Rol.destroy_all
    Accion.destroy_all
    Rseguimiento.destroy_all
    Aseguimiento.destroy_all
    Causa.destroy_all
    
end
  end




       