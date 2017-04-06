class MyAccionsController < ApplicationController
  def index
  	@employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
  	    
    @accion_search = Accion.where(employed_id: @employed.id)
    if params[:search]
    	
    	@acciones = @accion_search.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search5],params[:search6]).order(created_at: :desc)

    else 
    	@acciones = @accion_search.order(created_at: :desc)

    end


@resp = "resp"
  @route = misacciones_path

  end

 def asignado_por_mi
     
  
            
    
    @accion_search1 = Accion.where(user_id: current_user.id).where(admin_user: current_user.admin_user)
    if params[:search]
      
      @acciones = @accion_search1.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5]).order(created_at: :desc)

    else 
     @acciones = @accion_search1.order(created_at: :desc)

    end

    
@resp = "asig"
@route = accions_asignados_path

    render "index"
  end



def invitado
     
  @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
   
     
    
            
    
   @accion_search1 = @employed.accions

    if params[:search]
      
      @acciones = @accion_search1.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6]).order(created_at: :desc)

    else 
      @acciones = @accion_search1.order(created_at: :desc)

    end
    
@resp = "n/a"
@route = accions_invitado_path

    render "index"
  end

end
