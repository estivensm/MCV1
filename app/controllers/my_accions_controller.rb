class MyAccionsController < ApplicationController
  def index
  	@employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
  	@acciones = []
    
    @accion_search = Accion.where(admin_user: current_user.admin_user)
    if params[:search]
    	
    	@accion = @accion_search.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search5],params[:search6])

    else 
    	@accion = @accion_search

    end



  	@accion.each do |accion|

  		@acciones.push accion.id if accion.employeds.exists?(id: @employed.id)
        
                     
		
            
  	end 

    @accion_search1 = Accion.where(employed_id: @employed)
    if params[:search]
    	
    	@accion1 = @accion_search1.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search5],params[:search6])

    else 
    	@accion1 = @accion_search1

    end



  	@accion1.each do |accion1|
        
        @acciones.push accion1
  	end



  end
end
