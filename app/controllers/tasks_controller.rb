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
     @accion = Accion.find(params[:accion_id])
    if @task.update(justificacion_cumplio: params[:justificacion_cumplio], cumplio: params[:cumplio] , change_cumplio: params[:cumplio])
      
              
         @tasks =  @accion.tasks.abiertas
         @tasksc =  @accion.tasks.cerradas
    
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


  def get_task
      @task = Task.find(params[:id])
      @accion = @task.accion
      @report = @task.report
      responsable_full_task = @task.employed.first_name + @task.employed.first_last_name
      responsable_full_accion = @accion.employed.first_name + @accion.employed.first_last_name
      responsable_full_report = @report.employed.first_name + @report.employed.first_last_name
      render json: { 
        :task => @task.as_json.merge(:responsable => responsable_full_task,:description => @task.name, :image => @task.employed.avatare_url), 
        :task => @accion.as_json.merge(:responsable => responsable_full_accion,:description => @accion.descripcion, :image => @task.employed.avatare_url), 
        :report => @report.as_json.merge(:responsable => responsable_full_report,:description => @report.description,  :image => @task.employed.avatare_url), 

      }

  end

  def close_task

    @task = Task.find(params[:id])
    @task.update(estado: true, observacion: params[:observacion],anexo: params[:anexo])
    if @task.save

      if params[:action_name] == "index"
        redirect_to mistasks_path
      elsif
        params[:action_name] == "pending"
          redirect_to pending_path
      elsif
        params[:action_name] == "tasks_abiertas"
          redirect_to tasks_abiertas_path    
      end
    end
    
  end
  


  def show
    @accion = @task.accion
    @tipo = @accion.tipo
    @report = Report.find(params[:report_id])
    @accions_t = @report.accions
    if @tipo == "Accion"
        @accions = @report.accions.where(tipo: "Accion").where.not(id: @accion.id).order(estado: :asc).order(created_at: :desc)
    elsif @tipo == "Actividad"
         @accions = @report.accions.where(tipo: "Actividad").where.not(id: @accion.id).order(estado: :asc).order(created_at: :desc)
    else
         @accions = @report.accions.where(tipo: "Correccion").where.not(id: @accion.id).order(estado: :asc).order(created_at: :desc)
    end  
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @actividad = Accion.where(report_id: @report.id).where(tipo: "Actividad").count
    @tasks = Task.where(report_id: @report.id)
    @seguimientos = @report.rseguimientos
    @seguimientosa = []
    @menu_accion = ["","",""]
    @accions_t.each do |accion|
       accion.aseguimientos.each do |seg| 
        
        @seguimientosa << seg

       end 

    end

    @menu_accion = ["","",""]
     if @accion.tipo == "Correccion" 
         
         @menu_accion = ["active","",""]
         
     elsif @accion.tipo == "Accion"

       @menu_accion = ["","active",""]

     else

       @menu_accion = ["","","active"]
     end  

   @seguimientos_t = @seguimientos + @seguimientosa
    
     render  :layout => 'admin_report'
     

  end


  # GET /tasks/new
  def new
    @task = Task.new
    @report = Report.find(params[:report_id]) 
    @accion = Accion.find(params[:accion_id])
  end

  # GET /tasks/1/edit
  def edit
    @report = Report.find(params[:report_id])
    @accion = Accion.find(params[:accion_id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @report = Report.find(params[:report_id])
    @accion = Accion.find(params[:accion_id])
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
      respond_to do |format|
        format.js
         puts "11111111111111111111111111111111111111111"
         @tasks =  @accion.tasks.order(f_compromiso: :asc)
      
         #render partial: "accions/task_abiertas", params: @tasks, status:200
        
        end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
  @report = Report.find(params[:report_id])
  @accion = Accion.find(params[:accion_id])
      if @task.update(task_params)
        @tasks =  @accion.tasks.abiertas
        @tasksc =  @accion.tasks.cerradas
        if params[:remove_anexo]
        @task.remove_evidencia!
        @task.save
      
      end
     
      end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @report = Report.find(params[:report_id]) 
    @accion = Accion.find(params[:accion_id])
    @taskd = @task.id
    if @task.destroy
         
         @tasks =  @accion.tasks.abiertas
         @tasksc =  @accion.tasks.cerradas
    end
         
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id, :admin_user, :employed_id, :report_id, :name, :observacion, :costo, :f_compromiso, :f_real, :estado,:accion_id ,:cumplio, :contador, :contador_seg, :anexo, :codigo,:remove_anexo)
    end
end
