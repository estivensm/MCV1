module MyTasksHelper



#Metodo para que cambie el texto en la columna de asignaciones en mis acciones  
 def asignacion_title_task(title)


   	if title == "index" || title == "mytask_cerradas"

   		"Me Asigno"

    elsif title == "asignado_por_mi" || title == "mytask_asignadas_cerradas"

    	"Asignada A"
   
    end	
 end 

#Metodo para que cambie el nombre en la columna de asignaciones en mis acciones  
def asignacion_name_task(id, title)

	task = Task.find(id)

   if title == "asignado_por_mi"

   		task.employed.first_name + " " + task.employed.first_last_name

    	
    else

    	get_employed(task.user.email).first_name + " " + get_employed(task.user.email).first_last_name
    end	
 end 


end
