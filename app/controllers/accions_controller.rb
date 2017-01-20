class AccionsController < ApplicationController
  before_action :set_accion, only: [:show, :edit, :update, :destroy]

  # GET /accions
  # GET /accions.json
  def index
    @tipo = "Accion"
    @report = Report.find(params[:report_id]) 
    @accions = @report.accions
   end

  

  def correcciones
    @tipo = "Correccion"
     @report = Report.find(params[:report_id]) 
    @accions = @report.accions.where(tipo: "Correccion")
   

    render 'index'
    
  end

  # GET /accions/1
  # GET /accions/1.json
  def show
    @report = Report.find(params[:report_id]) 
  
  end

  # GET /accions/new
  def new
     @tipo = params[:tipo]
    @accion = Accion.new
     @report = Report.find(params[:report_id]) 
  end

  # GET /accions/1/edit
  def edit
     @tipo = params[:tipo]
     @report = Report.find(params[:report_id]) 
  end

  # POST /accions
  # POST /accions.json
  def create
    @accion = Accion.new(accion_params)
    @report = Report.find(params[:report_id]) 
    @accion.estado = "Abierta"
    @num = Accion.where(admin_user: current_user.admin_user).where(report_id: @report.id).maximum(:contador)
    if @num != nil
        @num = @num + 1

    else
        @num = 1001
    end
    @ano = Time.now.year.to_s
    @ano = @ano.remove("20") 
 
    @code= "ACC-#{@num}-#{@ano}" 
    @accion.codigo = @code
    @accion.contador = @num
    respond_to do |format|
      if @accion.save
        format.html { redirect_to report_accion_path(@report,@accion), notice: 'Accion was successfully created.' }
        format.json { render :show, status: :created, location: @accion }
      else
        format.html { render :new }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accions/1
  # PATCH/PUT /accions/1.json
  def update
     @report = Report.find(params[:report_id]) 
    respond_to do |format|
      if @accion.update(accion_params)
        format.html { redirect_to report_accion_path(@report,@accion), notice: 'Accion was successfully updated.' }
        format.json { render :show, status: :ok, location: @accion }
      else
        format.html { render :edit }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accions/1
  # DELETE /accions/1.json
  def destroy
    @report = Report.find(params[:report_id]) 
    @accion.destroy
    respond_to do |format|
      format.html { redirect_to report_accions_url(@report), notice: 'Accion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accion
      @accion = Accion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accion_params
      params.require(:accion).permit(:codigo, :employed_id, :descripcion, :tipo, :costo, :f_seguimiento, :f_compromiso, :f_real, :estado, :cumplio, :contador, :evidencia, :contador_seg, :user_id, :admin_user, :fp_seguimiento, :report_id,:employed_ids => [])
    end
end
