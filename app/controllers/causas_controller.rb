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
     @causa_pareto = CausaEfecto.where(causa_id: @causa.id).where(tipo: "Pareto").where("porcentaje <= ?", 80)
     @causa_paretot = CausaEfecto.where(causa_id: @causa.id).where(tipo: "Pareto").where("porcentaje > ?" , 80)

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
      format.html { redirect_to report_path(@report), notice: 'Causa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def edit_caef

      @caef = CausaEfecto.find(params[:id])
      
  end
  def new_caef
      @causa = Causa.find(params[:causa])
       @report = Report.find(@causa.report_id)
       @m = params[:m]
     
      
  end

   def update_caef

  @causa = CausaEfecto.find(params[:id])
  if @causa.update(descripcion:params[:descripcion],name:params[:name])
    
    redirect_to :back
  end
      
  end

   def create_caef
        @causa = CausaEfecto.create(user_id:params[:user_id],admin_user:params[:admin_user],descripcion:params[:descripcion],nivel:params[:nivel],tipo:params[:tipo],causa_id:params[:causa_id],report_id:params[:report_id],name:params[:name])
  if @causa.save
    
    redirect_to :back
  end
end

  def destroy_caef
@causa = CausaEfecto.find(params[:id])

  if @causa.destroy
    
    redirect_to :back
  end
end

def show_caef

@caef = CausaEfecto.find(params[:id])
@causa = Causa.find(@caef.causa_id)

  
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_causa
      @causa = Causa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def causa_params
      params.require(:causa).permit(:tipo, :descripcion, :archivo, :admin_user, :user_id, :report_id,:primera_m, :seguna_m,:tercera_m,:cuarta_m,:quinta_m, :sexta_m, causa_efectos_attributes: [:id, :name, :user_id,:nivel,:descripcion,:tipo,:report_id,:causa_id,:admin_user,:frecuencia, :porcentaje, :_destroy])
    end
end
