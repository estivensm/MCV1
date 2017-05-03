class AccionsController < ApplicationController
  before_action :set_accion, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!
  # GET /accions
  # GET /accions.json
 

respond_to :json
  def get_acciontodos
    @task = Accion.where( admin_user: current_user.admin_user).abiertas
    events = []
    @task.each do |task|
      if task.contador_seg > 5
        @color = "#0db4a0"
      elsif task.contador_seg <= 5 && task.contador_seg >= 0
          @color = "orange"
      else
          @color = "#d82c2c"
    end
      events << {:id => task.id, :title => "#{task.name} ", :start => "#{task.f_compromiso}" , :color => "#{@color2}", :url =>"reports/#{task.report_id}/accions/#{task.id}"}
    end
        render :text => events.to_json
  end 







  def index
    @tipo = "Accion"
    @report = Report.find(params[:report_id]) 
    @accions = @report.accions.where(tipo: "Accion").order(created_at: :desc)
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
       @tasks = Task.where(report_id: @report.id)

   end

  

  def correcciones
    @tipo = "Correccion"
     @report = Report.find(params[:report_id]) 
    @accions = @report.accions.where(tipo: "Correccion").order(created_at: :desc)
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @tasks = Task.where(report_id: @report.id)

    render 'index'
    
  end


def actividades
    @tipo = "Actividad"
     @report = Report.find(params[:report_id]) 
    @accions = @report.accions.where(tipo: "Actividad").order(created_at: :desc)
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @tasks = Task.where(report_id: @report.id)

    render 'index'
    
  end


  # GET /accions/1
  # GET /accions/1.json
  def show
    @report = Report.find(params[:report_id]) 
    @seguimientos = @accion.aseguimientos.order(created_at: :desc)
    @riesgos = @accion.riesgos.order(created_at: :desc)
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @tasks = Task.where(report_id: @report.id)

  
  end


  def acciones_todas
      
        
    @accion_search = Accion.where(admin_user:current_user.admin_user)
    if params[:search]
      
      @acciones = @accion_search.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search2],params[:search3],params[:search5],params[:search6]).order(created_at: :desc)

    else 
      @acciones = @accion_search.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end


@resp = "Todas las Acciones"
  @route = acciones_todas_path

  end

  def acciones_abiertas
      
        
    @accion_search = Accion.where(admin_user:current_user.admin_user).abiertas
    if params[:search]
      
      @acciones = @accion_search.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search2],params[:search3],params[:search5],params[:search6]).order(created_at: :desc)

    else 
      @acciones = @accion_search.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end


@resp = "Acciones Abiertas"
  @route = acciones_abiertas_path

  render "acciones_todas"

  end


  def acciones_cerradas
      
        
    @accion_search = Accion.where(admin_user:current_user.admin_user).cerradas
    if params[:search]
      
      @acciones = @accion_search.paginate(page: params[:page],:per_page => 30).search(params[:search0],params[:search],params[:search2],params[:search3],params[:search5],params[:search6]).order(created_at: :desc)

    else 
      @acciones = @accion_search.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end

   


@resp = "Acciones Cerradas"
  @route = acciones_cerradas_path

  render "acciones_todas"

  end


 def acciones_calendar



    end


  # GET /accions/new
  def new
     @tipo = params[:tipo]
    @accion = Accion.new
     @report = Report.find(params[:report_id]) 
  end

  # GET /accions/1/edit
  def edit
     @tipo = @accion.tipo
     @report = Report.find(params[:report_id]) 
     @accion.tag = false
  end

  # POST /accions
  # POST /accions.json
  def create
    @accion = Accion.new(accion_params)
    @report = Report.find(params[:report_id]) 
    @accion.estado = "Abierta"
    @num = Accion.where(admin_user: current_user.admin_user).where(report_id: @report.id).where(tipo: @accion.tipo).maximum(:contador)
    if @num != nil
        @num = @num + 1

    else
        @num = 1001
    end
    @ano = Time.now.year.to_s
    @ano = @ano.remove("20") 
   
    @accion.tipo== "Accion" ? tp = "ACC" : tp = "CORR" 
    tp = "ACT" if @accion.tipo == "Actividad"

    @code= "#{tp}-#{@num}-#{@ano}" 
    @accion.codigo = @code
    @accion.contador = @num
    @accion.costo = 0
    
    respond_to do |format|
      if @accion.save
       
        format.html { redirect_to report_accion_path(@report,@accion), notice: 'La Accion fue creada correctamente.' }
        format.json { render :show, status: :created, location: @accion }
      else
        format.html { render :new }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accions/1
  # PATCH/PUT /accions/1.json
  def update
     @report = Report.find(params[:report_id]) 
    respond_to do |format|
      if @accion.update(accion_params)
        format.html { redirect_to report_accion_path(@report,@accion), notice: 'La Accion fue editada correctamente' }
        format.json { render :show, status: :ok, location: @accion }
      else
        format.html { render :edit }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accions/1
  # DELETE /accions/1.json
  def destroy
    @report = Report.find(params[:report_id]) 
    @accion.destroy
    respond_to do |format|
      format.html { redirect_to report_accions_url(@report), notice: 'La Accion fue borrada correctamente' }
      format.json { head :no_content }
    end
  end



 def accion_change_state
 
    @accion = Accion.find(params[:accion])
    if @accion.update(justificacion_cumplio: params[:justificacion_cumplio], cumplio: true ,change_cumplio: true, tag: false)
    redirect_to report_accion_path(@accion.report_id,@accion)
  end
 
    


 end 




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accion
      @accion = Accion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accion_params
      params.require(:accion).permit(:codigo, :employed_id, :descripcion, :tipo, :costo, :f_seguimiento, :f_compromiso, :f_real, :estado, :cumplio, :contador, :evidencia, :contador_seg, :user_id, :admin_user,:eficaz,:name ,:fp_seguimiento,:cierra_id, :tag,:s_cierre , :report_id,:employed_ids => [],:causa_efecto_ids => [])
    end
end
