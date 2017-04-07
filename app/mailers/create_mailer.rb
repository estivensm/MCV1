class CreateMailer < ApplicationMailer

#Envia el correo al responsable
def create_report(employed , report)
  @employed = employed
  @report = report
  mail(to: @employed.email, subject: "Te han asignado un Reporte #{@report.codigo}")
end

#Envia el correo a los Invitados
def invitado_report(employed , report)
  @employed = employed
  @report = report
  mail(to: @employed.email, subject: "Estas Invitado a participar en un reporte #{@report.codigo}")
end




def create_accion(employed , accion)
  @employed = employed
  @accion = accion
  mail(to: @employed.email, subject: "Te han asignado una #{@accion.tipo} #{@accion.codigo}")
end
def invitado_accion(employed , accion)
  @employed = employed
  @accion = accion
  mail(to: @employed.email, subject: "Estas Invitado a participar en una accion #{@accion.codigo}")
end







def seguimiento_report(employed , seg)
  @employed = employed
  @seg = seg
  mail(to: @employed.email, subject: "Se hizo un seguimiento al Reporte #{@seg.report.codigo}")
end


def seguimiento_accion(employed , seg)
  @employed = employed
  @seg = seg
  mail(to: @employed.email, subject: "Se hizo un seguimiento la Accion #{@seg.accion.codigo}")
end


def noty_task(employed , task)
  @employed = employed
  @task= task
  mail(to: @employed.email, subject: "Se creo la Tarea #{@task.codigo}")
end







end


