class ProcesosController < ApplicationController
 before_action :authenticate_user!
  before_action :set_proceso, only: [:show, :edit, :update, :destroy]
    before_action :configuracion

  
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path

        
    end
    
  end

  # GET /procesos
  # GET /procesos.json
  def index

 
    
   
   if params[:search] || params[:search1]
     @procesos1 = Proceso.where(admin_user: current_user.admin_user).search(params[:search], params[:search1])
  else
     @procesos1 = Proceso.where(admin_user: current_user.admin_user)
  end



   @procesos = @procesos1.paginate(page: params[:page],:per_page => 30)
    

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

def delete_procesos
    Proceso.where(:id => params[:proceso_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to procesos_path }
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
      params.require(:proceso).permit!
    end
end
