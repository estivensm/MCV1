class CausasController < ApplicationController
  before_action :set_causa, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /causas
  # GET /causas.json
  def index
    @causas = Causa.all
     @report = Report.find(params[:report_id])
  end

  # GET /causas/1
  # GET /causas/1.json
  def show
     @report = Report.find(params[:report_id])
  end

  # GET /causas/new
  def new
    @causa = Causa.new
    @report = Report.find(params[:report_id])
  end

  # GET /causas/1/edit
  def edit
     @report = Report.find(params[:report_id])
  end

  # POST /causas
  # POST /causas.json
  def create
    
     @report = Report.find(params[:report_id])
    @causa = Causa.new(causa_params)
    if @causa.save
        redirect_to report_causa_path(@report,@causa)
    end
  end

  # PATCH/PUT /causas/1
  # PATCH/PUT /causas/1.json
  def update
     @report = Report.find(params[:report_id])
    if @causa.update(causa_params)
        redirect_to report_causa_path(@report,@causa)
         end
  end

  # DELETE /causas/1
  # DELETE /causas/1.json
  def destroy
     @report = Report.find(params[:report_id])
    @causa.destroy
    respond_to do |format|
      format.html { redirect_to causas_url, notice: 'Causa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_causa
      @causa = Causa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def causa_params
      params.require(:causa).permit(:tipo, :descripcion, :archivo, :admin_user, :user_id, :report_id)
    end
end
