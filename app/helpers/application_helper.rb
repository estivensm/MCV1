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
 lsif controller.controller_name == "sources"
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
if params[:params] == "Abierto"
  
@menu_a = ["active","",""]
elsif params[:params] == "Cerrado"
  @menu_a = ["","active",""]
else

  @menu_a = ["","","active"]
end
 return @menu_a

 end 






  
end
