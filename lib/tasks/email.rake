namespace :email do
  desc "Sends the most voted products created yesterday"
  task daily_products: :environment do
    ReportMailer.noty_report(Employed.last, Report.first).deliver_now
    for i in(0..20000)
    a = "hola#{i}"
    Proceso.create(name: a)
end
  end
end