class ClassificationRisksController < ApplicationController
  before_action :set_classification_risk, only: [:show, :edit, :update, :destroy]

  # GET /classification_risks
  # GET /classification_risks.json
  def index
    @classification_risks = ClassificationRisk.all
  end

  # GET /classification_risks/1
  # GET /classification_risks/1.json
  def show
  end

  # GET /classification_risks/new
  def new
    @classification_risk = ClassificationRisk.new
  end

  # GET /classification_risks/1/edit
  def edit
  end

  # POST /classification_risks
  # POST /classification_risks.json
  def create
    @classification_risk = ClassificationRisk.new(classification_risk_params)

    respond_to do |format|
      if @classification_risk.save
        format.html { redirect_to @classification_risk, notice: 'Classification risk was successfully created.' }
        format.json { render :show, status: :created, location: @classification_risk }
      else
        format.html { render :new }
        format.json { render json: @classification_risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classification_risks/1
  # PATCH/PUT /classification_risks/1.json
  def update
    respond_to do |format|
      if @classification_risk.update(classification_risk_params)
        format.html { redirect_to @classification_risk, notice: 'Classification risk was successfully updated.' }
        format.json { render :show, status: :ok, location: @classification_risk }
      else
        format.html { render :edit }
        format.json { render json: @classification_risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classification_risks/1
  # DELETE /classification_risks/1.json
  def destroy
    @classification_risk.destroy
    respond_to do |format|
      format.html { redirect_to classification_risks_url, notice: 'Classification risk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification_risk
      @classification_risk = ClassificationRisk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classification_risk_params
      params.require(:classification_risk).permit(:user_id, :admin_user, :name, :description, :context)
    end
end
