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


  def hola
    
  if controller.controller_name == "views" || controller.controller_name == "procesos" || controller.controller_name == "cargos" || controller.controller_name == "companies"|| controller.controller_name == "employeds"
    return true
  else
    return false
  end
  end

   def sub_menu
      
    @menu = ["","","","",""]
  if  controller.controller_name == "companies" 
    @menu = ["active","","",""]
  elsif controller.controller_name == "procesos"
@menu = ["","active","",""]
  elsif controller.controller_name == "cargos"
    @menu = ["","","active",""]
    elsif controller.controller_name == "views"
 @menu = ["","","","active"]
 elsif controller.controller_name == "employeds"
 @menu = ["","","","",""]
    end
    return @menu

end
def cargos
  u = User.find(current_user.id)
@cargoss = u.cargos
return @cargoss
end
	
end
