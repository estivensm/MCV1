class RiesgosController < ApplicationController
before_action :authenticate_user!
before_action :set_riesgo, only: [:show, :edit, :update, :destroy]

  # GET /riesgos
  # GET /riesgos.json
  def index
    @riesgos = Riesgo.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 20)
  end

  # GET /riesgos/1
  # GET /riesgos/1.json
  def show
   @fuente = SourceParent.where(admin_user: current_user.admin_user).where(codigo:"PR").first
   @tipo = Source.where(admin_user: current_user.admin_user).where(codigo:"RG").first
   @fuente_existe = !@fuente.nil? && !@tipo.nil? ? true : false

  end

  # GET /riesgos/new
  def new
    @riesgo = Riesgo.new
    
  end

  # GET /riesgos/1/edit
  def edit
     
  
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
      params.require(:riesgo).permit(:user_id, :admin_user, :risk_source_id, :report_id, :accion_id, :descripcion,:proceso_id,:context,:treatment,:classification_risk_id,:justification,:state,:risk_state,:risk_value ,:clasificacion, :nivel)
    end
end
   