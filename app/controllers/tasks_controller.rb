class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
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
    
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
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
      params.require(:task).permit(:user_id, :admin_user, :employed_id, :report_id, :name, :observacion, :costo, :f_compromiso, :f_real, :estado, :cumplio, :contador, :contador_seg, :anexo, :codigo)
    end
end
