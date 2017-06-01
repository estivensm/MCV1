class TasksController < ApplicationController
before_action :authenticate_user!
before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
 
def tasks_todas
@tasks_search1 = Task.where(admin_user: current_user.admin_user)
    if params[:search]
        
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search5]).order(created_at: :desc)

    else 
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end
@route = tasks_todas_path

@nombre = "Todas las Tareas"

end

def tasks_abiertas

@tasks_search1 = Task.where(admin_user: current_user.admin_user).abiertas
    if params[:search]
        
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search5]).order(created_at: :desc)

    else 
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end
@route = tasks_abiertas_path

@nombre = "Tarea Abiertas"
render "tasks_todas"
end


def tasks_cerradas
@tasks_search1 = Task.where(admin_user: current_user.admin_user).cerradas
    if params[:search]
        
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search5]).order(created_at: :desc)

    else 
        @tasks = @tasks_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end
@route = tasks_cerradas_path
@nombre = "Tareas Cerradas"
render "tasks_todas"
end

 def task_change_state
   
    @task= Task.find(params[:task])
     @report = Report.find(@task.report_id)
    if @task.update(justificacion_cumplio: params[:justificacion_cumplio], cumplio: params[:cumplio] , change_cumplio: params[:cumplio])
    redirect_to report_tasks_path(@report)
  end

end

def taskst_calendar


end


















  def index
    @report = Report.find(params[:report_id])
    @tasks_all = @report.tasks
    @tasks = @report.tasks.abiertas
    @tasksc = @report.tasks.cerradas
       @accions = @report.accions.where(tipo: "Correccion").order(created_at: :desc)
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @actividad = Accion.where(report_id: @report.id).where(tipo: "Actividad").count
    
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @report = Report.find(params[:report_id]) 
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @report = Report.find(params[:report_id]) 
  end

  # GET /tasks/1/edit
  def edit
    @report = Report.find(params[:report_id]) 
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @report = Report.find(params[:report_id])
    @task = Task.new(task_params)
    @task.estado = false
      @num = Task.where(admin_user: current_user.admin_user).where(report_id: @report.id).maximum(:contador)
    if @num != nil
        @num = @num + 1

    else
        @num = 1001
    end
    @ano = Time.now.year.to_s
    @code = "T#{@num}" 
    @task.codigo = @code
    @task.contador = @num
    @task.costo = 0
    @employed = Employed.find(@task.employed_id)
    if @task.save
      
      redirect_to report_tasks_path(@report)
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
  @report = Report.find(params[:report_id])
  
      if @task.update(task_params)
        if params[:remove_anexo]
        @task.remove_evidencia!
        @task.save
      end
      redirect_to report_tasks_path(@report)
      end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
     @report = Report.find(params[:report_id]) 
    @task.destroy
    respond_to do |format|
      format.html { redirect_to report_tasks_path(@report), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id, :admin_user, :employed_id, :report_id, :name, :observacion, :costo, :f_compromiso, :f_real, :estado, :cumplio, :contador, :contador_seg, :anexo, :codigo,:remove_anexo)
    end
end
