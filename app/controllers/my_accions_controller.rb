class MyAccionsController < ApplicationController
  def index
  	@employed = Employed.where(email: current_user.email).first
  	@accions = []
  	Accion.where(admin_user: current_user.admin_user).each do |accion|

  		@accions.push accion.id if accion.employeds.exists?(id: @employed.id)
            

  		
            
  	end 

    


  end
end
