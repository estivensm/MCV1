class CreateMailer < ApplicationMailer

#Envia el correo del Reporte al responsable
def create_report(employed , report)
  @employed = employed
  @report = report
  mail(to: @employed.email, subject: "Te han asignado un Reporte #{@report.codigo}")
end

#Envia el correo del Reporte a los Invitados
def invitado_report(employed , report)
  @employed = employed
  @report = report
  mail(to: @employed.email, subject: "Estas Invitado a participar en un reporte #{@report.codigo}")
end



#Envia el correo de la  Accion al Responsable
def create_accion(employed , accion)
  @employed = employed
  @accion = accion
  mail(to: @employed.email, subject: "Te han asignado una #{@accion.tipo} #{@accion.codigo}")
end

#Envia el correo de la  Accion al Responsable
def invitado_accion(employed , accion)
  @employed = employed
  @accion = accion
  mail(to: @employed.email, subject: "Estas Invitado a participar en una accion #{@accion.codigo}")
end


#Envia el correo de la Tarea al Responsable
def create_task(employed , task)
  @employed = employed
  @task= task
  mail(to: @employed.email, subject: "Te han Asignado una Tarea #{@task.codigo}")
end



#Envia el correo del seguimiento al Responsable
def create_seguimiento_report(employed , seg)
  @employed = employed
  @seg = seg
  mail(to: @employed.email, subject: "Se hizo un seguimiento al Reporte #{@seg.report.codigo}")
end

#Envia el correo del seguimiento a la Acción
def create_seguimiento_accion(employed , seg)
  @employed = employed
  @seg = seg
  mail(to: @employed.email, subject: "Se hizo un seguimiento a la  #{@seg.accion.tipo} #{@seg.accion.codigo}")
end









end


