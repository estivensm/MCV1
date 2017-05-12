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
  end

  # GET /riesgos/new
  def new
    @riesgo = Riesgo.new
    @accion = Accion.find(params[:accion_id])
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
    @accion = Accion.find(params[:accion_id])
   if @riesgo.save
        redirect_to report_accion_path(@report,@accion)
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
