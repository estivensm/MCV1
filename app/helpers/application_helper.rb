module ApplicationHelper



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
  elsif controller.controller_name == "reports" 
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

  
end
