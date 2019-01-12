module MyAccionsHelper



#Metodo para que cambie el texto en la columna de asignaciones en mis acciones  
 def asignacion_title_accion(title)


   	if title == "index" || title == "myaccions_cerradas"

   		"Me Asigno"

    elsif title == "asignado_por_mi" || title == "myaccions_asignadas_cerradas"

    	"Asignada A"
    else

    	"Me invito"
    end	
 end 

#Metodo para que cambie el nombre en la columna de asignaciones en mis acciones  
def asignacion_name_accion(id, title)

	accion = Accion.find(id)

   if title == "asignado_por_mi"

   		accion.employed.first_name + " " + accion.employed.first_last_name

    	
    else

    	get_employed(accion.user.email).first_name + " " + get_employed(accion.user.email).first_last_name
    end	
 end 


end
