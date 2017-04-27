class MyTasksController < ApplicationController
  def index

    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @tasks_search1 = Task.where(employed_id: @employed).abiertas
    if params[:search]
    	
    	@tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search5]).order(created_at: :desc)

    else 
    	@tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end

@route = mistasks_path
@nombre = "Mis Tareas Abiertas"

  end


def  mytask_cerradas
 @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @tasks_search1 = Task.where(employed_id: @employed).cerradas
    if params[:search]
      
      @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search5]).order(created_at: :desc)

    else 
      @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end

@route = mytask_cerradas_path
@nombre = "Mis Tareas Cerrdas"
render "index"

end








  def asignado_por_mi

    @tasks_search1 = Task.where(user_id: current_user.id).abiertas
    if params[:search]
        
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search5]).order(created_at: :desc)

    else 
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end
@route = tasks_asignados_path


@nombre = "Tareas asignadas Abiertas"
render "index"
  end



def mytask_asignadas_cerradas
@tasks_search1 = Task.where(user_id: current_user.id).cerradas
    if params[:search]
        
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search5]).order(created_at: :desc)

    else 
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end
@route = mytask_asignadas_cerradas_path

@nombre = "Tareas asignadas Cerradas"
render "index"
end

end