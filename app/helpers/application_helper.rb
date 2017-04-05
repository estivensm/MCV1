module ApplicationHelper

def action_type
    
   if action_name == "new" 
    return "Crear"
else
     return "Editar"
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
def get_contacts

  Contact.where(admin_user: current_user.admin_user)

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

def get_clientes

  ClinteProveedor.where(admin_user: current_user.admin_user)

end

def get_procesos

  Proceso.where(admin_user: current_user.admin_user)

end
def get_sources

  Source.where(admin_user: current_user.admin_user)

end
def get_numerals
Numeral.where(admin_user: current_user.admin_user)

end
def get_rols
Rol.where(admin_user: current_user.admin_user)

end
def get_clientes
ClinteProveedor.where(admin_user: current_user.admin_user)

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
    @menum = ["","", "", "" ,""]
  if controller.controller_name == "views" || controller.controller_name == "procesos" || controller.controller_name == "cargos" || controller.controller_name == "companies"|| controller.controller_name == "employeds" || controller.controller_name == "normas" ||controller.controller_name == "numerals" ||controller.controller_name == "sources" ||controller.controller_name == "rols" ||controller.controller_name == "clinte_proveedors"
    @menum = ["active1","", "", "", ""]
  elsif (controller.controller_name == "reports" && action_name =="index" ||  (controller.controller_name == "reports" && action_name =="abiertos")||  (controller.controller_name == "reports" && action_name =="cerrados")) 
    @menum = ["","active1","", "",""]
  elsif controller.controller_name == "my_accions"  
    @menum = ["","","active1", "",""]
     elsif controller.controller_name == "my_reports"  
    @menum = ["","","", "active1",""]
  elsif controller.controller_name == "dashboard"  
    @menum = ["","","","", "active1"]
  
  end
  return @menum
  end

   def sub_menu
      
    @menu = ["","","","","","","","",""]
  if  controller.controller_name == "companies" 
    @menu = ["active","","","","","","","",""]
  elsif controller.controller_name == "procesos"
@menu = ["","active","","","","","","","",""]
  elsif controller.controller_name == "cargos"
    @menu = ["","","active","","","","","",""]
    elsif controller.controller_name == "views"
 @menu = ["","","","active","","","","",""]
 elsif controller.controller_name == "employeds"
 @menu = ["","","","","active","","","",""]
 elsif controller.controller_name == "normas"
 @menu = ["","","","","","active","","",""]
elsif controller.controller_name == "numerals"
 @menu = ["","","","","","active","","",""]
 elsif controller.controller_name == "sources"
 @menu = ["","","","","","","active","",""]
 elsif controller.controller_name == "rols"
 @menu = ["","","","","","","","active",""]
elsif controller.controller_name == "clinte_proveedors"
 @menu = ["","","","","","","","","active"]
    end
    return @menu

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

@menu_a = ["","",""]
if  action_name == "abiertos"
  
@menu_a = ["active","",""]
elsif action_name  =="cerrados"
  @menu_a = ["","active",""]
  
else

  @menu_a = ["","","active"]
end
 return @menu_a

 end 
 
 def menu_misreports

@menu_ma = ["","","",""]
if  controller_name == "my_reports" && action_name == "asignado_por_mi"
  
@menu_ma = ["active","", "",""]
 
 elsif controller_name == "my_reports" && action_name == "invitado"
@menu_ma = ["","","active",""] 
 elsif controller_name == "my_reports" &&  action_name == "reports_calendar"
@menu_ma = ["","","", "active"]   
elsif controller_name == "my_reports" &&  action_name == "index"

  @menu_ma = ["","active","",""]

end
 return @menu_ma

 end 



   def menu_misaccions

@menu_mac = ["","","",""]
if  controller_name == "my_accions" && action_name == "asignado_por_mi"
  
@menu_mac = ["active","", "",""]
 
 elsif controller_name == "my_accions" && action_name == "invitado"
@menu_mac = ["","","active",""] 
  
elsif controller_name == "my_accions" &&  action_name == "index"

  @menu_mac = ["","active","",""]

end
 return @menu_mac

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


def get_date(fecha)
   

    ds = fecha.strftime("%w") #Dia de la semana
    y = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "Ene", "02" => "Feb","03"=>"Mar","04" => "Abr", "05" => "May","06"=> "Jun" ,"07"=> "Jul", "08" => "Ago", "09"=> "Sep" ,"10"=> "Oct","11" => "Nov" ,"12" => "Dic" }
    dias = {"1" => "Domingo", "2" => "Lunes","3"=>"Martes","4" => "Miercoles", "5" => "Jueves","6"=> "Viernes" ,"0" =>"Sabado"}
    return  dm + " " + meses[m] + ", " + y 
#dias[ds] + ", " + 
end


def get_reports_source

  Report.where(admin_user: current_user.admin_user).group(:source_id).count
  
end

  def get_employed(email)
            Employed.where(email: email).where(admin_user: current_user.admin_user).first
            
      end

      def get_admin

            current_user.admin_user

      end

      def get_employed1
            Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first # Devuelve el empleado relacionado con el Usuario
            
      end
 
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

      "#0db497 !important"
    elsif cont <=5 && cont >= 0

      "orange !important"
      
      else

        "#e23434 !important"

    end
      
end




def show_reports
if current_user.role !=  "Basico" || current_user.rol.report_ver || current_user.rol.report_procesos

  true

else 
  false
end
end






end
