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

def get_cargos

  Cargo.where(admin_user: current_user.admin_user)

end
def get_employeds

  Employed.where(admin_user: current_user.admin_user)

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

def company_x
    @company = Company.where(user_id: current_user.admin_user)
    return @company.last.id
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
    @menum = ["",""]
  if controller.controller_name == "views" || controller.controller_name == "procesos" || controller.controller_name == "cargos" || controller.controller_name == "companies"|| controller.controller_name == "employeds" || controller.controller_name == "normas" ||controller.controller_name == "numerals" ||controller.controller_name == "sources"
    @menum = ["active",""]
  elsif controller.controller_name == "reports"  || controller.controller_name == "accions" || controller.controller_name == "causas" 
    @menum = ["","active"]
  
  end
  return @menum
  end

   def sub_menu
      
    @menu = ["","","","","","",""]
  if  controller.controller_name == "companies" 
    @menu = ["active","","","","","",""]
  elsif controller.controller_name == "procesos"
@menu = ["","active","","","","","",""]
  elsif controller.controller_name == "cargos"
    @menu = ["","","active","","","",""]
    elsif controller.controller_name == "views"
 @menu = ["","","","active","","",""]
 elsif controller.controller_name == "employeds"
 @menu = ["","","","","active","",""]
 elsif controller.controller_name == "normas"
 @menu = ["","","","","","active",""]
elsif controller.controller_name == "numerals"
 @menu = ["","","","","","active",""]
 elsif controller.controller_name == "sources"
 @menu = ["","","","","","","active"]
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




def page_entries_info(collection, options = {})
  entry_name = options[:entry_name] || (collection.empty?? 'Reporte' :
      collection.first.class.name.split('::').last.titleize)
  if collection.total_pages < 2
    case collection.size
    when 0; "No #{entry_name.pluralize}Encontrados"
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
    meses = {"01" => "Enero", "02" => "Febrero","03"=>"Marzo","04" => "Abril", "05" => "Mayo","06"=> "Junio" ,"07"=> "Julio", "08" => "Agosto", "09"=> "Septiembre" ,"10"=> "Octubre","11" => "Noviembre" ,"12" => "Diciembre" }
    dias = {"1" => "Domingo", "2" => "Lunes","3"=>"Martes","4" => "Miercoles", "5" => "Jueves","6"=> "Viernes" ,"0" =>"Sabado"}
    return  dm + " " + meses[m] + ", " + y 
#dias[ds] + ", " + 
end


def get_reports_source

  Report.where(admin_user: current_user.admin_user).group(:source_id).count
  
end


  
end
