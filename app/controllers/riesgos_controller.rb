class RiesgosController < ApplicationController
before_action :authenticate_user!
before_action :set_riesgo, only: [:show, :edit, :update, :destroy]

  # GET /riesgos
  # GET /riesgos.json
  def index
    @riesgos = Riesgo.all
  end

  # GET /riesgos/1
  # GET /riesgos/1.json
  def show
    
    @report = Report.find(params[:report_id])
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @actividad = Accion.where(report_id: @report.id).where(tipo: "Actividad").count
    @accions = Accion.where(report_id: @report.id)
    @tasks = Task.where(report_id: @report.id)
    @cliente_proveedors1 = ClinteProveedor.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @menu_accion = ["","",""]
    @seguimientos = @report.rseguimientos.order(created_at: :desc)
    @seguimientosa = []
    @accions.each do |accion|
       accion.aseguimientos.each do |seg| 
        
        @seguimientosa << seg

       end 

    end
    @seguimientos_t = @seguimientos + @seguimientosa

    @accion_eficaz = @report.accions.where(eficaz: true).count
    @accion_noeficaz = @report.accions.where(eficaz: false).count


    render :layout => "admin_report"
  end

  # GET /riesgos/new
  def new
    @riesgo = Riesgo.new
    @report = Report.find(params[:report_id])
  end

  # GET /riesgos/1/edit
  def edit
     @accion = Accion.find(params[:accion_id])
    @report = Report.find(params[:report_id])
  end

  # POST /riesgos
  # POST /riesgos.json
  def create
    @riesgo = Riesgo.new(riesgo_params)
     @report = Report.find(params[:report_id])
   
   if @riesgo.save
        redirect_to report_riesgo_path(@report,@riesgo)
    end
  end

  # PATCH/PUT /riesgos/1
  # PATCH/PUT /riesgos/1.json
  def update
    @accion = Accion.find(params[:accion_id])
     @report = Report.find(params[:report_id])
    @riesgo.update(riesgo_params)
    respond_to do |format|
      format.html { redirect_to report_accion_path(@report,@accion), notice: 'El Riesgo fue creado.' }
      format.json { head :no_content }
    end
  end

  # DELETE /riesgos/1
  # DELETE /riesgos/1.json
  def destroy
    @accion = Accion.find(params[:accion_id])
     @report = Report.find(params[:report_id])
    @riesgo.destroy
    respond_to do |format|
      format.html { redirect_to report_accion_path(@report,@accion), notice: 'Aseguimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_riesgo
      @riesgo = Riesgo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def riesgo_params
      params.require(:riesgo).permit(:user_id, :admin_user, :report_id, :accion_id, :descripcion, :clasificacion, :nivel)
    end
end
