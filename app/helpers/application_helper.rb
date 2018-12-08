module ApplicationHelper

def action_type
    
   if action_name == "new" 
    return "Crear"
else
     return "Editar"
    end
end

def get_classification
  ClassificationRisk.where(admin_user: current_user.admin_user)
end

def get_RiskSource
  RiskSource.where(admin_user: current_user.admin_user)
end


def enable_report

  Proceso.where(admin_user: current_user.admin_user).exists? ?  procesos = true : procesos = false
  Cargo.where(admin_user: current_user.admin_user).exists? ?  cargos = true : cargos = false
  Source.where(admin_user: current_user.admin_user).exists? ?  sources = true : sources = false
  Employed.where(admin_user: current_user.admin_user).first.first_name != nil  &&  !Employed.where(admin_user: current_user.admin_user).first.first_name.empty? ?  employeds = true : employeds = false

 
 if procesos && cargos && sources && employeds
    
    true
  else

    false   
 end


end

def compled_employed


  Employed.where(admin_user: current_user.admin_user).first.first_name != nil  &&  !Employed.where(admin_user: current_user.admin_user).first.first_name.empty? ?  employeds = true : employeds = false
 
 if  employeds
    
    true
  else

    false   
 end


end







def get_extension(ext)

  case ext
when "xls"
  return "/assets/Excel-icon.png"
when "pdf"
  return "/assets/pdf-icon.png"
when "doc"
  return "/assets/word-icon.png"
when "ppt"
  return "/assets/PowerPoint-icon.png"
when "pptx"
  return "/assets/PowerPoint-icon.png"
when "ppp"
  return "/assets/PowerPoint-icon.png"  
when "zip"
  return "/assets/zip-icon.png"  
else
  return "/assets/png-icon.png"
end


  end

def get_state(state)

  state == true ? a = "<i class='fa fa-check' aria-hidden='true'></i>" : a = "<i class='fa fa-times' aria-hidden='true'></i>"
  
end




#Devuleve candado abierto si state = true si no devuelve candado abierto
def get_state_candado(state)

  state == true ? a = "<i class='fas fa-lock' aria-hidden='true'></i>" : a = "<i class='fas fa-lock-open' style='color:#bdb628' aria-hidden='true'></i>"
  
end

#Devuleve candado abierto si state = "Cerrada" si no devuelve candado abierto
def get_state_candado_string(state) 

  state == "Cerrada" ? a = "<i class='fas fa-lock' aria-hidden='true'></i>" : a = "<i class='fas fa-lock-open' style='color:#bdb628' aria-hidden='true'></i>"
  
end

def get_state_string(state) 

  state == "Cerrada" ? a = "Cerrada" : a = "Abierta"
  
end


def cumplio(state)

  state ? a = "<i class='far fa-thumbs-up' aria-hidden='true' style = 'color:green;font-size:20px;margin-left:5px'></i>" : a = "<i class='far fa-thumbs-down' aria-hidden='true' style = 'color:red;font-size:20px;margin-left:5px'></i>"
  
end


def get_state_report(state, id, tipo)
  if tipo == "C"

  state == true ? Report.find(id).accions.where(tipo: "Correccion").count : a = "<i class='fa fa-times' aria-hidden='true'></i>"
  elsif tipo == "AC"
      state == true ? (Report.find(id).causas.first.tipo if Report.find(id).causas.first)  : a = "<i class='fa fa-times' aria-hidden='true'></i>"


     elsif tipo == "ACC"
        state == true ? Report.find(id).accions.where(tipo: "Accion").count : a = "<i class='fa fa-times' aria-hidden='true'></i>"
         elsif tipo == "ACT"
        state == true ? Report.find(id).accions.where(tipo: "Actividad").count : a = "<i class='fa fa-times' aria-hidden='true'></i>"


       elsif tipo == "T"
  state == true ? Report.find(id).tasks.count : a = "<i class='fa fa-times' aria-hidden='true'></i>"


       end


end

def get_contacts

  Contact.where(admin_user: current_user.admin_user)

end

def get_RiskSource

  RiskSource.where(admin_user: current_user.admin_user)

end

def get_users

  User.where(admin_user: current_user.admin_user)

end
def get_users_noadmin

  User.where(admin_user: current_user.admin_user).where.not(role:"SuperAdmin")

end

def get_cargos

  Cargo.where(admin_user: current_user.admin_user)

end
def get_employeds

  Employed.where(admin_user: current_user.admin_user)

end

def get_clientes_all

  ClinteProveedor.where(admin_user: current_user.admin_user)

end

def get_tipo_parte

  ClienteProveedorType.where(admin_user: current_user.admin_user)

end

def get_procesos

  Proceso.where(admin_user: current_user.admin_user)

end
def get_sources

  Source.where(admin_user: current_user.admin_user)

end
def get_source_parents

  SourceParent.where(admin_user: current_user.admin_user)

end
def get_numerals
Numeral.where(admin_user: current_user.admin_user).or(Numeral.where(admin: true))

end
def get_rols
Rol.where(admin_user: current_user.admin_user)

end

def get_clientes
ClinteProveedor.where(tipo: "Cliente").where(admin_user: current_user.admin_user)

end

def get_proveedores
ClinteProveedor.where(tipo: "Proveedor").where(admin_user: current_user.admin_user)

end

def get_otros
ClinteProveedor.where.not(tipo: "Cliente").where.not(tipo: "Proveedor").where(admin_user: current_user.admin_user)

end

def get_classification_risk

  ClassificationRisk.where(admin_user: current_user.admin_user)
  
end




def company_x
    @company = Company.where(user_id: current_user.admin_user)
    return @company.last.id
end
def get_normas
Norma.where(admin_user: current_user.admin_user)

end

def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end


  def menu
    @menum = ["","", "", "" ,"", "","","","", ""]
  if controller.controller_name == "views" || controller.controller_name == "procesos" || controller.controller_name == "cargos" || (controller.controller_name == "companies" && action_name != "company_indicators") || (controller.controller_name == "employeds" && action_name != "edit_myself" && (action_name == "show" && current_user.rol.configuracion) || (controller.controller_name == "employeds" && action_name == "index") ) || controller.controller_name == "normas" ||controller.controller_name == "numerals" ||controller.controller_name == "sources" ||controller.controller_name == "rols" || controller.controller_name == "clinte_proveedors" || controller.controller_name == "cliente_proveedor_types" ||controller.controller_name == "source_parents"
    @menum = ["active2","", "", "", "", "","","", ""]
  elsif (controller.controller_name == "reports" && action_name =="index" ||  (controller.controller_name == "reports" && action_name =="abiertos")||  (controller.controller_name == "reports" && action_name =="cerrados" ) || (controller.controller_name == "reports" && action_name =="reportst_calendar" ) ) 
    @menum = ["","active1","", "","", "","","active4","active4", ""]
  elsif controller.controller_name == "my_accions"  
    @menum = ["","","active1", "","", "","","","", ""]
     elsif controller.controller_name == "my_reports"  
    @menum = ["","","", "active1","", "","","", ""]
    elsif controller.controller_name == "dashboard"  
    @menum = ["","","","", "active1", "","","","", ""]
  elsif controller.controller_name == "my_tasks"  
    @menum = ["","","", "","","active1","","","", ""]
      elsif controller.controller_name == "companies" && action_name == "company_indicators"  
    @menum = ["","","", "","","","active1","","", ""]
  elsif controller.controller_name == "accions" && (action_name == "acciones_todas" || action_name == "acciones_abiertas" || action_name == "acciones_cerradas")   
    @menum = ["","","", "","","","","active1","", ""]

     elsif controller.controller_name == "tasks" && (controller.action_name == "tasks_todas" || controller.action_name == "tasks_abiertas" || controller.action_name == "tasks_cerradas")   
    @menum = ["","","", "","","","","","active1", ""]

       elsif controller.controller_name == "riesgos"   
        puts "riesgossssssssssssssssssssssssssssssssssssssssssssss"
    @menum = ["","","", "","","","","","", "active1"]
  end




  return @menum
  end

   def sub_menu
      
    @menu = ["","","","","","","","","",""]
  if  controller.controller_name == "companies" 
    @menu = ["active","","","","","","","","",""]
  elsif controller.controller_name == "procesos"
@menu = ["","active","","","","","","","","",""]
  elsif controller.controller_name == "cargos"
    @menu = ["","","active","","","","","","",""]
    elsif controller.controller_name == "views"
 @menu = ["","","","active","","","","","",""]
 elsif controller.controller_name == "employeds" && action_name != "edit_myself"
 @menu = ["","","","","active","","","","",""]
 elsif controller.controller_name == "normas"
 @menu = ["","","","","","active","","","",""]
elsif controller.controller_name == "numerals"
 @menu = ["","","","","","active","","","",""]
 elsif controller.controller_name == "sources"
 @menu = ["","","","","","","active","","",""]
 elsif controller.controller_name == "rols"
 @menu = ["","","","","","","","active","",""]
elsif controller.controller_name == "clinte_proveedors"
 @menu = ["","","","","","","","","active",""]
 elsif controller.controller_name == "source_parents"
 @menu = ["","","","","","","","","","active"]
    end
    return @menu

end


def menu_report
  @menu_report = ["","","","","",""]
  corre =  action_name == "correcciones"
  riesgo =  controller_name == "riesgos"
  accion =  controller_name == "accions" && action_name == "index"
  actividad =  controller_name == "accions" && action_name == "actividades"
  
  if controller_name == "reports" && action_name == "show" 
        
        @menu_report = ["active","","","","",""]
        
    elsif controller.controller_name == "rseguimientos"

      @menu_report = ["","active","","","",""]

    elsif corre
     
      @menu_report = ["","","active","","",""]

      elsif accion
     
    @menu_report = ["","","","active","",""]

    elsif actividad
     
    @menu_report = ["","","","","active",""]

  elsif riesgo
     
    @menu_report = ["","","","","","active"]
  

  end

end

def cargos
  u = User.find(current_user.id)
@cargoss = u.cargos
return @cargoss
end
	
 def devise_error_messages?
    !resource.errors.empty?
  end

def menu_hallazgo

@menu_a = ["","","",""]
if  action_name == "abiertos"
  
@menu_a = ["active","","", ""]
elsif action_name  =="cerrados"
  @menu_a = ["","active",""]
  elsif action_name  =="reportst_calendar"
  @menu_a = ["","","","active"]
else

  @menu_a = ["","","active",""]
end
 return @menu_a

 end 




def menu_acciones

@menu_acc = ["","","",""]
if  action_name == "acciones_todas"
  
@menu_acc = ["active","","", ""]
elsif action_name  =="acciones_abiertas"
  @menu_acc = ["","active",""]
  elsif action_name  =="acciones_cerradas"
  @menu_acc= ["","","","active"]
else

  @menu_acc = ["","","active",""]
end
 return @menu_acc

 end 


 def menu_tareas

@menu_tar = ["","","",""]
if  action_name == "tasks_todas"
  
@menu_tar = ["active","","", ""]
elsif action_name  =="tasks_abiertas"
  @menu_tar = ["","active",""]
  elsif action_name  =="tasks_cerradas"
  @menu_tar = ["","","","active"]
else

  @menu_tar = ["","","active",""]
end
 return @menu_tar

 end 









 
 def menu_misreports

@menu_ma = ["","","",""]
if  controller_name == "my_reports" && (action_name == "asignado_por_mi" || action_name == "asignados_cerrados")
  
@menu_ma = ["active","", "",""]
 
 elsif controller_name == "my_reports" && action_name == "invitado"
@menu_ma = ["","","active",""] 
 elsif controller_name == "my_reports" &&  action_name == "reports_calendar"
@menu_ma = ["","","", "active"]   
elsif controller_name == "my_reports" &&  (action_name == "index" || action_name == "mis_reports_cerrados")

  @menu_ma = ["","active","",""]

end
 return @menu_ma

 end 



   def menu_misaccions

@menu_mac = ["","","",""]
if  controller_name == "my_accions" && (action_name == "asignado_por_mi" ||  action_name == "myaccions_asignadas_cerradas")
  
@menu_mac = ["active","", "",""]
 
 elsif controller_name == "my_accions" && action_name == "invitado"
@menu_mac = ["","","active",""] 
  
elsif controller_name == "my_accions" &&  (action_name == "index" || action_name == "myaccions_cerradas")

  @menu_mac = ["","active","",""]

end
 return @menu_mac

 end 


  def menu_mistasks

@menu_tak = ["",""]
if  controller_name == "my_tasks" && (action_name == "asignado_por_mi" || action_name == "mytask_asignadas_cerradas")
  
@menu_tak = ["active",""]
 
 
  
elsif controller_name == "my_tasks" && ( action_name == "index" || action_name == "mytask_cerradas")

  @menu_tak = ["","active","",""]

end
 return @menu_tak

 end 











def page_entries_info(collection, options = {})
  entry_name = options[:entry_name] || (collection.empty?? 'Reporte' :
      collection.first.class.name.split('::').last.titleize)
  if collection.total_pages < 2
    case collection.size
    when 0; "No hay #{entry_name.pluralize} registrados"
    else; %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
    end
  else
    %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
  end
end

def page_clasification_info(collection, options = {})
  entry_name = options[:entry_name] || (collection.empty?? 'Reporte' :
      collection.first.class.name.split('::').last.titleize)
  if collection.total_pages < 2
    case collection.size
    when 0; "No hay #{entry_name.pluralize} registrados"
    else; %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
    end
  else
    %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
  end
end

def page_riesgo_info(collection, options = {})
  entry_name = options[:entry_name] || (collection.empty?? 'Riesgo' :
      collection.first.class.name.split('::').last.titleize)
  if collection.total_pages < 2
    case collection.size
    when 0; "No hay #{entry_name.pluralize} registrados"
    else; %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
    end
  else
    %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
  end
end

def page_risk_info(collection, options = {})
  entry_name = options[:entry_name] || (collection.empty?? 'Riesgo' :
      collection.first.class.name.split('::').last.titleize)
  if collection.total_pages < 2
    case collection.size
    when 0; "No hay #{entry_name.pluralize} registrados"
    else; %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
    end
  else
    %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
  end
end




def get_date(fecha)
   
if fecha != nil
    ds = fecha.strftime("%w") #Dia de la semana
    y = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "Ene", "02" => "Feb","03"=>"Mar","04" => "Abr", "05" => "May","06"=> "Jun" ,"07"=> "Jul", "08" => "Ago", "09"=> "Sep" ,"10"=> "Oct","11" => "Nov" ,"12" => "Dic" }
    dias = {"1" => "Domingo", "2" => "Lunes","3"=>"Martes","4" => "Miercoles", "5" => "Jueves","6"=> "Viernes" ,"0" =>"Sabado"}
    return  dm + " " + meses[m] + ", " + y 
#dias[ds] + ", " +
end 
end

  
  def get_reports_source

     Report.where(admin_user: current_user.admin_user).group(:source_id).count
  
  end

  
  #DEVULEVE EL EMPLEADO DADO EL EMAIL DEL USUARIO
  def get_employed(email)
  
     Employed.where(email: email).where(admin_user: current_user.admin_user).first
            
  end

  #DEVUELVE EL ID DEL USUARIO CUENTA
  def get_admin

     current_user.admin_user

  end
  
  #DEVUELVE EL USUARIO RELACIONADO CON EL USUARIO
  def get_employed1
  
    Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first 
            
  end
 
    #METODO PARA SABER SI PUEDE CREEAR GESTION
  def view_report(report)

    a = get_employed(current_user.email )
    if report.employed_id == a.id || current_user.role == "SuperAdmin"
        
      return true
          
    else
        
      return false
                
    end

  end





  def myproces_report(report)
      a = get_employed(current_user.email)
    if report.proceso_id == a.cargo.proceso_id 
        return true
       
    else
        return false
             
  end
end

def estado_contador(cont)

    if cont >5 

      "#22c488 !important"
    elsif cont <=5 && cont >= 0

      if action_name != "cerrados"

      "orange !important"
      else
"#0db497 !important"
      end
      else

        "#e23434 !important"

    end
      
end

def estado_contador_alert(cont)

    if cont >5 

      "success"
    elsif cont <=5 && cont >= 0
        
        "warning"
     
      else

        "danger"

    end
      
end

def estado_contador_tasks(accion)

    if accion.tasks.abiertas.any?
    if accion.tasks.where('contador_seg < ?', 0).any?  
       "#e23434 !important"
      
    elsif accion.tasks.where('contador_seg >= ?', 0).where('contador_seg <= ?', 5).any?
      

      "orange !important"
    
      else
        
        "#22c488 !important"
        

    end

  else
      
      "#a4a4a4 !important"

  end
      
end


def get_color(color)
   
  c = ""
  color < 0 ? c = "#d82c2c" : c = "orange"
  c = "#22c488" if color > 5
  return c

  end


  def get_color_porcentaje(color)
   
  c = ""
  color < 60 ? c = "#d82c2c" : c = "orange"
  c = "#22c488" if color > 90
  return c

  end




def show_reports
  if current_user.role !=  "Basico" || current_user.rol.report_ver || current_user.rol.report_procesos

    true

  else 
    false
  end
end


def get_size
  
  report_size = 0
  Report.where(admin_user: current_user.admin_user).each do |report|
        
      #report_size = report_size + (report.archivo? ? report.archivo.file.size : 0)
      

  end
  Norma.where(admin_user: current_user.admin_user).each do |norma|
        
      #report_size = report_size + ( norma.archivo? ? norma.archivo.file.size : 0)
      

  end
  Rseguimiento.where(admin_user: current_user.admin_user).each do |rseg|
        
      #report_size = report_size + ( rseg.evidencia? ? rseg.evidencia.file.size : 0)
      

  end
  Aseguimiento.where(admin_user: current_user.admin_user).each do |aseg|
        
      #report_size = report_size + ( aseg.evidencia? ? aseg.evidencia.file.size : 0)
      

  end
  Task.where(admin_user: current_user.admin_user).each do |task|
        
      #report_size = report_size + (task.anexo? ? task.anexo.file.size : 0 )
      

  end
   Employed.where(admin_user: current_user.admin_user).each do |emp|
        
      #report_size = report_size + ( emp.avatare? ? emp.avatare.file.size : 0)
      

  end
return (report_size.to_f/1000000000).round(3)

end


def tiene_riesgo(riesgo)
    

    if riesgo.downcase.include? "riesgo"
        
        true
    else

       false
    end  

end

def estado_alerta(contador)
  
   if contador > 5
          
        "vigente"

   elsif contador >= 0 && contador <= 5
        
        "proximo"
   elsif contador < 5
    
        "vencido"

   end 


end
  

def  get_tratamiento(tratamiento)


  case tratamiento

  when "Eludir"
      
      "No proseguir con la actividad riesgosa (!No siempre es posible !)"      

  when "Transferir"
      
      "Que otra parte soporte parte del riesgo (Pensar en que nuevos riesgos ocasiona este cambio) "
    
  when "Reducir"

     "Tomar medidas tendientes a reducir la probabilidad de ocurrencia y/o impacto, (No siempre implica costos financieros adicionales, incluso puede ahorrar dinero)"

  when "Asumir"
     
     "Aceptar el riesgo inherente (!Pero conociéndolo!)"
  
  end        
  
end



def  get_deficiencia(nd)


  

  if nd == 10
      
      ["Se ha(n) detectado peligro(s) que determina(n) como posible la generación de
incidentes o consecuencias muy significativas, o la eficacia del conjunto de medidas
preventivas existentes respecto al riesgo es nula o no existe, o ambos. ", "Muy Alto (MA) " ]    

  elsif nd == 6
      
      ["Se ha(n) detectado algún(os) peligro(s) que pueden dar lugar a consecuencias
significativa(s), o la eficacia del conjunto de medidas preventivas existentes es baja, o
ambos", "Alto (A) " ]  
    
  elsif nd == 2

     ["Se han detectado peligros que pueden dar lugar a consecuencias poco significativas
o de menor importancia, o la eficacia del conjunto de medidas preventivas
existentes es moderada, o ambos. s", "Medio (M)" ]  

  elsif nd == 1
     
     ["No se ha detectado consecuencia alguna, o la eficacia del conjunto de medidas
preventivas existentes es alta, o ambos. El riesgo está controlado. ", "Bajo (B) " ]  
  
  end        
  

end

def  get_exposicion(ne)


  

  if ne == 4
      
      ["La situación de exposición se presenta sin interrupción o varias veces con
tiempo prolongado durante la jornada laboral.", "Continua (EC) " ]    

  elsif ne == 3
      
      ["Se ha(n) detectado algún(os) peligro(s) que pueden dar lugar a consecuencias
significativa(s), o la eficacia del conjunto de medidas preventivas existentes es baja, o
ambos", "Frecuente (EF) " ]  
    
  elsif ne == 2

     ["La situación de exposición se presenta alguna vez durante la jornada laboral
y por un periodo de tiempo corto.", "Ocasional (EO) " ]  

  elsif ne == 1
     
     ["La situación de exposición se presenta de manera eventual. ", "Esporádica (EE) " ]  
  
  end        
  

end
















def  get_probabilidad(np)


  

  if (np <= 40 && np >= 20) 
      
      ["Situación deficiente con exposición continua, o muy deficiente con exposición frecuente. Normalmente la materialización del riesgo ocurre con frecuencia. ", "Muy Alto (MA) " ]    

  elsif (np <= 20 && np >= 10)
      
      ["Situación deficiente con exposición frecuente u ocasional, o bien situación
muy deficiente con exposición ocasional o esporádica.
La materialización del riesgo es posible que suceda varias veces en la vida laboral", "Alto (A) " ]  
    
  elsif (np <= 8 && np >= 6)

     ["Situación deficiente con exposición esporádica, o bien situación mejorable
con exposición continuada o frecuente.
Es posible que suceda el daño alguna vez. ", "Medio (M)" ]  

  elsif (np <= 4 && np >= 2)
     
     ["Situación mejorable con exposición ocasional o esporádica, o situación sin
anomalía destacable con cualquier nivel de exposición.
No es esperable que se materialice el riesgo, aunque puede ser concebible. ", "Bajo (B) " ]  
  
  end        
  
end

def  get_concecuencia(nc)


  

  if (nc == 100) 
      
      ["Muerte (s) ", "Mortal o Catastrófico (M) "]      

  elsif (nc == 60)
      
      ["Lesiones o enfermedades graves irreparables (Incapacidad permanente parcial o invalidez).  ", "Muy grave (MG) "] 
    
  elsif (nc == 25)

     ["Lesiones o enfermedades con incapacidad laboral temporal (ILT). ", "Grave (G) "] 

  elsif (nc == 10)
     
    [ "Lesiones o enfermedades que no requieren incapacidad. ", "Leve (L) "] 
  
  end        
  
end

def  get_riesgo(nr)


  

  if (nr <= 4000 && nr >= 600)
         
   ["Situación crítica. Suspender actividades hasta que el riesgo esté bajo control.  Intervención urgente. ", "I - Inaceptable", "red"]

         

  elsif nr <= 500  && nr >= 150
         
   ["Corregir y adoptar medidas de control de inmediato. Sin embargo, suspenda actividades si el nivel de riesgo está por encima o igual de 360. ", "II - Moderado", "#ccc70e"]
    
  elsif  nr <= 120 && nr >= 40
         
   ["Mejorar si es posible. Sería conveniente justificar la intervención y su rentabilidad." ,"III - Tolerable","#5cb85c"]

  elsif (nr <= 20 )
         
   ["Mantener las medidas de control existentes, pero se deberían considerar soluciones o mejoras y se deben hacer comprobaciones periódicas para asegurar que el riesgo aún es aceptable." ,"IV - Aceptable","#5cb85c"]
  
  end        
  
end




                           



end
