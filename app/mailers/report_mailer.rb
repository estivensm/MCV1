class ReportMailer < ApplicationMailer
	def noty_report(employed , report)
  @employed = employed
  @report = report
  mail(to: @employed.email, subject: "Se creo el reporte #{@report.codigo}")
end

def invitado_report(employed , report)
  @employed = employed
  @report = report
  mail(to: @employed.email, subject: "Se creo el reporte #{@report.codigo}")
end

def noty_accion(employed , accion)
  @employed = employed
  @accion = accion
  mail(to: @employed.email, subject: "Se creo la accion #{@accion.codigo}")
end
def invitado_accion(employed , accion)
  @employed = employed
  @accion = accion
  mail(to: @employed.email, subject: "Se creo la accion #{@accion.codigo}")
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


