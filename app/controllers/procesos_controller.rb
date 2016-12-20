class ProcesosController < ApplicationController
  before_action :set_proceso, only: [:show, :edit, :update, :destroy]

  # GET /procesos
  # GET /procesos.json
  def index

    if current_user.rol ==  "SuperAdmin" || current_user.rol ==  "Admin"
    @procesos = Proceso.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user)
    else
      redirect_to root_path
  end

  end

  # GET /procesos/1
  # GET /procesos/1.json
  def show
  end

  # GET /procesos/new
  def new
    @proceso = Proceso.new
  end

  # GET /procesos/1/edit
  def edit
  end

  # POST /procesos
  # POST /procesos.json
  def create
    @proceso = Proceso.new(proceso_params)
    if @proceso.save
        redirect_to procesos_path
    end
    
  end

  # PATCH/PUT /procesos/1
  # PATCH/PUT /procesos/1.json
  def update
    
      if @proceso.update(proceso_params)
        redirect_to procesos_path
         end
  end

  # DELETE /procesos/1
  # DELETE /procesos/1.json
  def destroy
    @proceso.destroy
    respond_to do |format|
      format.html { redirect_to procesos_url, notice: 'Proceso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceso
      @proceso = Proceso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proceso_params
      params.require(:proceso).permit(:name, :description, :user_id, :admin_user)
    end
end
