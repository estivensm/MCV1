class MyAccionsController < ApplicationController
  def index
  	@employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
  	    
    @accion_search = Accion.where(employed_id: @employed.id)
    if params[:search]
    	
    	@acciones = @accion_search.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search5],params[:search6])

    else 
    	@acciones = @accion_search

    end


@resp = "resp"
  
  end

 def asignado_por_mi
     
  
            
    
    @accion_search1 = Accion.where(user_id: current_user.id).where(admin_user: current_user.admin_user)
    if params[:search]
      
      @acciones = @accion_search1.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5])

    else 
     @acciones = @accion_search1

    end

    
@resp = "asig"

    render "index"
  end



def invitado
     
  @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
   
     
    
            
    
   @accion_search1 = @employed.accions

    if params[:search]
      
      @acciones = @accion_search1.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6])

    else 
      @acciones = @accion_search1

    end
    
@resp = "n/a"
    render "index"
  end

end
