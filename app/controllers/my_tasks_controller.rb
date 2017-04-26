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


  end

  def asignado_por_mi

    @tasks_search1 = Task.where(user_id: current_user.id).abiertas
    if params[:search]
        
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search5]).order(created_at: :desc)

    else 
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end
@route = tasks_asignados_path

render "index"


  end
end
