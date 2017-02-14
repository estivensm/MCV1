class RseguimientosController < ApplicationController
  before_action :set_rseguimiento, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token


  # GET /rseguimientos
  # GET /rseguimientos.json
  def index
    @rseguimientos = Rseguimiento.all
     @report = Report.find(params[:report_id]) 

  end

  # GET /rseguimientos/1
  # GET /rseguimientos/1.json
  def show
  end

  # GET /rseguimientos/new
  def new
    @rseguimiento = Rseguimiento.new
    @report = Report.find(params[:report_id]) 
  end

  # GET /rseguimientos/1/edit
  def edit
     @report = Report.find(params[:report_id]) 
  end

  # POST /rseguimientos
  # POST /rseguimientos.json
  def create
    @report = Report.find(params[:report_id])
    @rseguimiento = Rseguimiento.new(rseguimiento_params)

    if @rseguimiento.save
      redirect_to report_path(@report)
    end
 
    
  end

  # PATCH/PUT /rseguimientos/1
  # PATCH/PUT /rseguimientos/1.json
  def update
     @report = Report.find(params[:report_id]) 
      if @rseguimiento.update(rseguimiento_params)
       redirect_to report_path(@report)
      end
    
 
  end

  # DELETE /rseguimientos/1
  # DELETE /rseguimientos/1.json
  def destroy
     @report = Report.find(params[:report_id]) 
  
      if @rseguimiento.destroy
        
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rseguimiento
      @rseguimiento = Rseguimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rseguimiento_params
      params.require(:rseguimiento).permit(:user_id, :admin_user, :f_seguimiento, :descripcion, :report_id, :evidencia)
    end
end
