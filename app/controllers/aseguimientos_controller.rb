class AseguimientosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_aseguimiento, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
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
    @gestion_c = @accion.tasks.abiertas.count
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
    #@accion = Accion.find(params[:accion_id])
 
    if @aseguimiento.save
      respond_to do |format|
        format.js
         @accion = Accion.find(params[:accion_id])   
         @seguimientos = @accion.aseguimientos
           
         end
    end
  end

  # PATCH/PUT /aseguimientos/1
  # PATCH/PUT /aseguimientos/1.json
  def update
     @accion = Accion.find(params[:accion_id])
     @report = Report.find(params[:report_id])
    if @aseguimiento.update(aseguimiento_params)
     if params[:remove_evidencia]
        @aseguimiento.remove_evidencia!
        @aseguimiento.save
      end


       @seguimientos = @accion.aseguimientos

      
    end
  end

  # DELETE /aseguimientos/1
  # DELETE /aseguimientos/1.json
  def destroy
    @accion = Accion.find(params[:accion_id])
     @report = Report.find(params[:report_id])
     @aseguimientod = @aseguimiento.id
    if @aseguimiento.destroy
         
         @seguimientos = @accion.aseguimientos     
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aseguimiento
      @aseguimiento = Aseguimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aseguimiento_params
      params.require(:aseguimiento).permit(:user_id, :admin_user, :f_seguimiento, :descripcion, :cierra, :eficaz, :conclucion, :costo, :evidencia, :accion_id, :s_cierre, :send_mail, :remove_evidencia)
    end
end
