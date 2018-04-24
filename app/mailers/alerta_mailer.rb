class AlertaMailer < ApplicationMailer

def vencimiento_report(employed , report, tipo)
  @employed = employed
  @report = report
 
  if tipo == "proximo"
    var = "esta proximo a vencer"
  elsif tipo == "vencido"
    var = "se ha vencido"
  else
    var = "vence hoy"
  end
   @var = var
  mail(to: @employed.email, subject: "El Report #{@report.codigo} #{var}")
end


def vencimiento_accion(employed , accion, tipo)
  @employed = employed
  @accion = accion
 
  if tipo == "proxima"
    var = "esta proxima a vencer"
  elsif tipo == "vencida"
    var = "se ha vencido"
  else
    var = "vence hoy"
  end
   @var = var
  mail(to: @employed.email, subject: "La Accion #{@accion.codigo} #{var}")
end


def vencimiento_task(employed , task, tipo)
  @employed = employed
  @task = task
 
  if tipo == "proxima"
    var = "esta proxima a vencer"
  elsif tipo == "vencida"

    var = "se ha vencido"
  
  else
  
    var = "vence hoy"
  
  end
   @var = var
  mail(to: @employed.email, subject: "La terea #{@task.codigo} #{var}")
end


def seguimiento_report(employed , report, tipo)
 @employed = employed
 @report = report

  if tipo == "vencido"

    var = "Hoy debes hacer seguiemiento al"

 else
  
    var = "Tienes pendiente el seguiemiento al "
  
  end
  @var = var
 mail(to: @employed.email, subject: "#{var} al Reporte #{@report.codigo}")
end



def seguimiento_accion(employed , accion, tipo)
 @employed = employed
 @accion = accion
 if tipo == "vencida"

    var = "Hoy debes hacer seguiemiento a la"

 else
  
    var = "Tienes pendiente el seguiemiento a la "
  
  end
  @var = var
 mail(to: @employed.email, subject: "#{var} Acción #{@accion.codigo}")
end


def resumen(employed, report_v , report_p , report_h, report_s, accion_v , accion_p ,  accion_h,  accion_s )
  @report_v = report_v
  @report_p = report_p
  @report_h = report_h
  @report_s = report_s
  @accion_v = accion_v
  @accion_p = accion_p
  @accion_h = accion_h
  @accion_s = accion_s
  @employed = employed
  
  mail(to: @employed.email, subject: "Resumen de tus Pendientes")
end




end


