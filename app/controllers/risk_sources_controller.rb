class RiskSourcesController < ApplicationController
  before_action :set_risk_source, only: [:show, :edit, :update, :destroy]

  # GET /risk_sources
  # GET /risk_sources.json
  def index
    @risk_sources = RiskSource.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 20)
   
  end

  # GET /risk_sources/1
  # GET /risk_sources/1.json
  def show
  end

  # GET /risk_sources/new
  def new
    @risk_source = RiskSource.new
  end

  # GET /risk_sources/1/edit
  def edit
  end

  # POST /risk_sources
  # POST /risk_sources.json
  def create
    @risk_source = RiskSource.new(risk_source_params)

    respond_to do |format|
      if @risk_source.save
        format.html { redirect_to risk_sources_path, notice: 'Risk source was successfully created.' }
        format.json { render :show, status: :created, location: @risk_source }
      else
        format.html { render :new }
        format.json { render json: @risk_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /risk_sources/1
  # PATCH/PUT /risk_sources/1.json
  def update
    respond_to do |format|
      if @risk_source.update(risk_source_params)
        format.html { redirect_to risk_sources_path, notice: 'Risk source was successfully updated.' }
        format.json { render :show, status: :ok, location: @risk_source }
      else
        format.html { render :edit }
        format.json { render json: @risk_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risk_sources/1
  # DELETE /risk_sources/1.json
  def destroy
    @risk_source.destroy
    respond_to do |format|
      format.html { redirect_to risk_sources_url, notice: 'Risk source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def risk_source_form
        @risk_source = RiskSource.new
        @action = params[:action_params]


    
  end

  def create_risk_source

      @risk_source = RiskSource.create(user_id: params[:user_id] ,admin_user: params[:admin_user] ,name: params[:name] ,description: params[:description]  ,code: params[:code] )
      @action = params[:action_params]
      @risk_sources = RiskSource.where(admin_user: current_user.admin_user).order(created_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_risk_source
      @risk_source = RiskSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def risk_source_params
      params.require(:risk_source).permit(:user_id, :admin_user, :name, :description, :code)
    end
end
