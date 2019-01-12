module MyReportsHelper

#Metodo para que cambie el texto en la columna de asignaciones en mis acciones  
 def asignacion_title_report(title)


 	if title == "index" || title == "mis_reports_cerrados"

   		"Me Asigno"

    elsif title == "asignado_por_mi" || title == "asignados_cerrados"

    	"Asignado A"
    else

    	"Me invito"
    end	
 end 

#Metodo para que cambie el nombre en la columna de asignaciones en mis acciones  
def asignacion_name_report(id, title)



	report = Report.find(id)

   if title == "asignado_por_mi"

   		report.employed.first_name + " " + report.employed.first_last_name

    	
    else


        Employed.find(report.employed_reporta).first_name  + " " +  Employed.find(report.employed_reporta).first_last_name
    
    end	
 end 



end