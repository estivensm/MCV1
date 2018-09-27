class ValorationRisksController < ApplicationController
  before_action :set_valoration_risk, only: [:show, :edit, :update, :destroy]

  # GET /valoration_risks
  # GET /valoration_risks.json
  def index
    @riesgo = Riesgo.find(params[:riesgo_id])
    @valoration_risks = ValorationRisk.all
  end

  # GET /valoration_risks/1
  # GET /valoration_risks/1.json
  def show
     @riesgo = Riesgo.find(params[:riesgo_id])
  end

  # GET /valoration_risks/new
  def new
    @riesgo = Riesgo.find(params[:riesgo_id])
    @valoration_risk = ValorationRisk.new
  end

  # GET /valoration_risks/1/edit
  def edit
     @riesgo = Riesgo.find(params[:riesgo_id])
  end

  # POST /valoration_risks
  # POST /valoration_risks.json
  def create
    @valoration_risk = ValorationRisk.new(valoration_risk_params)
    @riesgo = Riesgo.find(params[:riesgo_id])
    @valoration_risk.user_id = current_user.id
    @valoration_risk.admin_user = current_user.admin_user 
    @valoration_risk.riesgo_id = @riesgo.id
    @valoration_risk.count = @riesgo.valoration_risks.count + 1
    respond_to do |format|
      if @valoration_risk.save
        @valoration_risk.np_value = @valoration_risk.nd_value.to_i * @valoration_risk.ne_value.to_i
        @valoration_risk.nr_value = @valoration_risk.np_value * @valoration_risk.nc_value

        @valoration_risk.save 
        @riesgo.risk_value = @valoration_risk.nr_value
        @riesgo.save
        format.html { redirect_to riesgo_path(@riesgo.id) }
        format.json { render :show, status: :created, location: @valoration_risk }
      else
        format.html { render :new }
        format.json { render json: @valoration_risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valoration_risks/1
  # PATCH/PUT /valoration_risks/1.json
  def update
    @riesgo = Riesgo.find(params[:riesgo_id])

    respond_to do |format|
      if @valoration_risk.update(valoration_risk_params)
        @valoration_risk.np_value = @valoration_risk.nd_value.to_i * @valoration_risk.ne_value.to_i
        @valoration_risk.nr_value = @valoration_risk.np_value * @valoration_risk.nc_value
        @valoration_risk.save
        @riesgo.risk_value = @valoration_risk.nr_value
        @riesgo.save
        format.html { redirect_to riesgo_path(@riesgo.id)}
        format.json { render :show, status: :ok, location: @valoration_risk }
      else
        format.html { render :edit }
        format.json { render json: @valoration_risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valoration_risks/1
  # DELETE /valoration_risks/1.json
  def destroy
    @riesgo = Riesgo.find(params[:riesgo_id])
    @valoration_risk.destroy
    respond_to do |format|
      format.html { redirect_to riesgo_path(@riesgo.id), notice: 'Valoration risk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valoration_risk
      @valoration_risk = ValorationRisk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valoration_risk_params
      params.require(:valoration_risk).permit(:controls, :np_value, :ne_value, :nd_value, :np_text, :ne_text, :nd_text, :nc_value, :nc_text, :probability_indicator, :impact_indicator, :nr_value, :risk_level, :user_id, :admin_user, :riesgo_id, :next_valoration, :valoration_date, :analysis,:controls_description)
    end
end
