class MyAccionsController < ApplicationController
before_action :authenticate_user!
  def index
  	@employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
  	    
    @accion_search = Accion.where(employed_id: @employed.id).abiertas
    if params[:search]
    	
    	@acciones = @accion_search.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search2],params[:search3],params[:search5],params[:search6]).order(created_at: :desc)

    else 
    	@acciones = @accion_search.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end


@resp = "Mis Actividades, Acciones y Correcciones Abiertas"
  @route = misacciones_path

  end



def myaccions_cerradas

@employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
        
    @accion_search = Accion.where(employed_id: @employed.id).cerradas
    if params[:search]
      
      @acciones = @accion_search.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search2],params[:search3],params[:search5],params[:search6]).order(created_at: :desc)

    else 
      @acciones = @accion_search.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end


  @resp = "Mis Actividades, Acciones y Correcciones Cerradas"
  @route = myaccions_cerradas_path
  render "index"

end









 def asignado_por_mi
     
  
            
    
    @accion_search1 = Accion.where(user_id: current_user.id).where(admin_user: current_user.admin_user).abiertas
    if params[:search]
      
      @acciones = @accion_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5]).order(created_at: :desc)

    else 
     @acciones = @accion_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end

    
@resp = "Actividades, Acciones y Correcciones Asignadas Abiertas"
@route = accions_asignados_path

    render "index"
  end



def myaccions_asignadas_cerradas
    @accion_search1 = Accion.where(user_id: current_user.id).where(admin_user: current_user.admin_user).cerradas
    if params[:search]
      
      @acciones = @accion_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5]).order(created_at: :desc)

    else 
     @acciones = @accion_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end

    
@resp = "Actividades, Acciones y Correcciones Asignadas Cerradas"
@route = myaccions_asignadas_cerradas_path

    render "index"


end











def invitado
     
  @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
   
     
    
            
    
   @accion_search1 = @employed.accions.abiertas

    if params[:search]
      
      @acciones = @accion_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5]).order(created_at: :desc)

    else 
      @acciones = @accion_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end
    
@resp = "Actividades, Acciones y Correcciones Invitado"
@route = accions_invitado_path

    render "index"
  end

end
