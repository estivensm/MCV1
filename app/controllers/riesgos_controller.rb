class RiesgosController < ApplicationController
before_action :authenticate_user!
before_action :set_riesgo, only: [:show, :edit, :update, :destroy]
include ApplicationHelper
  # GET /riesgos
  # GET /riesgos.json
  def index
    if params[:search] || params[:search2] || params[:search3]
        @riesgos = Riesgo.where(admin_user: current_user.admin_user).search(params[:search],params[:search2],params[:search3]).paginate(page: params[:page],:per_page => 20)
      else 
        @riesgos = Riesgo.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 20)
    end
  
    respond_to do |format|
      format.html
      format.js
      format.json do
        render json: RiesgosDatatable.new(view_context)
      end
    end

  end

  # GET /riesgos/1
  # GET /riesgos/1.json
  def show
   @fuente = SourceParent.where(admin_user: current_user.admin_user).where(codigo:"RG").first
   @tipo = Source.where(admin_user: current_user.admin_user).where(codigo:"RG").first
   @fuente_existe = !@fuente.nil? && !@tipo.nil? ? true : false

  end

  # GET /riesgos/new
  def new
    @riesgo = Riesgo.new
    if !params[:accion].nil?
       accion = Accion.find(params[:accion])
       @accion_msg = ["Este riesgo pertenece a la accion: #{accion.descripcion}", accion.id]
    else
       @accion_msg = ["", ""]
    end

    if !params[:peligro_id].nil?
        @peligro = params[:peligro_id]
   else
       @peligro = get_RiskSource.last.id
   end
    
  end

  # GET /riesgos/1/edit
  def edit
       if @riesgo.accion
       accion = Accion.find(@riesgo.accion.id)
       @accion_msg = ["Este riesgo pertenece a la accion: #{accion.descripcion}", accion.id]
    else
       @accion_msg = ["", ""]
    end
  
  end

  # POST /riesgos
  # POST /riesgos.json
  def create
    @riesgo = Riesgo.new(riesgo_params)
    @riesgo.user_id = current_user.id
    @riesgo.admin_user = current_user.admin_user 
   
   if @riesgo.save
        redirect_to riesgo_path(@riesgo)
    end
  end

  def indicadores
    
  end

  def accion_riesgo
      peligro = params[:peligro_id]
      redirect_to new_riesgo_path + "?peligro_id=#{peligro}&accion=#{params[:accion_id]}"
  end  
  # PATCH/PUT /riesgos/1
  # PATCH/PUT /riesgos/1.json
  def update
    
   
    @riesgo.update(riesgo_params)
    respond_to do |format|
      format.html { redirect_to riesgo_path(@riesgo), notice: 'El Riesgo fue creado.' }
      format.json { head :no_content }
    end
  end

  # DELETE /riesgos/1
  # DELETE /riesgos/1.json
  def destroy
   
    
    @riesgo.destroy
    respond_to do |format|
      format.html { redirect_to riesgos_path, notice: 'Aseguimiento was successfully destroyed.' }
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
      params.require(:riesgo).permit(:user_id, :admin_user, :risk_source_id, :report_id, :accion_id, :risk_type,:descripcion,:proceso_id,:context,:treatment,:classification_risk_id,:justification,:state,:risk_state,:risk_value ,:clasificacion, :nivel)
    end
end
   