class AseguimientosController < ApplicationController
  before_action :set_aseguimiento, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /aseguimientos
  # GET /aseguimientos.json
  def index
    @aseguimientos = Aseguimiento.all
  end

  # GET /aseguimientos/1
  # GET /aseguimientos/1.json
  def show
  end

  # GET /aseguimientos/new
  def new
    @aseguimiento = Aseguimiento.new
    @accion = Accion.find(params[:accion_id])
    @report = Report.find(params[:report_id])
  end

  # GET /aseguimientos/1/edit
  def edit
     @accion = Accion.find(params[:accion_id])
    @report = Report.find(params[:report_id])
  end

  # POST /aseguimientos
  # POST /aseguimientos.json
  def create
    @aseguimiento = Aseguimiento.new(aseguimiento_params)
 @report = Report.find(params[:report_id])
  @accion = Accion.find(params[:accion_id])
 
    if @aseguimiento.save
        redirect_to report_accion_path(@report,@accion)
    end
  end

  # PATCH/PUT /aseguimientos/1
  # PATCH/PUT /aseguimientos/1.json
  def update
     @accion = Accion.find(params[:accion_id])
     @report = Report.find(params[:report_id])
    @aseguimiento.update(aseguimiento_params)
    respond_to do |format|
      format.html { redirect_to report_accion_path(@report,@accion), notice: 'Seguimiento fue creado.' }
      format.json { head :no_content }
    end
  end

  # DELETE /aseguimientos/1
  # DELETE /aseguimientos/1.json
  def destroy
    @aseguimiento.destroy
    respond_to do |format|
      format.html { redirect_to aseguimientos_url, notice: 'Aseguimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aseguimiento
      @aseguimiento = Aseguimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aseguimiento_params
      params.require(:aseguimiento).permit(:user_id, :admin_user, :f_seguimiento, :descripcion, :cierra, :eficaz, :conclucion, :costo, :evidencia, :accion_id)
    end
end
