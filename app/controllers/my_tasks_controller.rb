class MyTasksController < ApplicationController
  def index

    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @tasks_search1 = Task.where(employed_id: @employed)
    if params[:search]
    	
    	@tasks = @tasks_search1.search(params[:search0],params[:search],params[:search5]).order(created_at: :desc)

    else 
    	@tasks = @tasks_search1.order(created_at: :desc)

    end

@route = mistasks_path


  end

  def asignado_por_mi

    @tasks_search1 = Task.where(user_id: current_user.id)
    if params[:search]
        
        @tasks = @tasks_search1.search(params[:search0],params[:search],params[:search5]).order(created_at: :desc)

    else 
        @tasks = @tasks_search1.order(created_at: :desc)

    end
@route = tasks_asignados_path

render "index"


  end
end
