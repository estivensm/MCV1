class RolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rol, only: [:show, :edit, :update, :destroy]
  before_action :configuracion

  
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path
    end
    
  end

  # GET /rols
  # GET /rols.json
  def index
   
   
   if params[:search]
     @rols1 = Rol.search(params[:search]).where(admin_user: current_user.admin_user)
  else
     @rols1 = Rol.where(admin_user: current_user.admin_user)
  end



   @rols = @rols1.paginate(page: params[:page],:per_page => 20)
   
  end






  # GET /rols/1
  # GET /rols/1.json
  def show
  end

  # GET /rols/new
  def new
    @rol = Rol.new
  end

  # GET /rols/1/edit
  def edit
  end

  # POST /rols
  # POST /rols.json
  def create
       @rol = Rol.new(rol_params)
    if @rol.save
        redirect_to rols_path
    end
  end

  # PATCH/PUT /rols/1
  # PATCH/PUT /rols/1.json
  def update
  if @rol.update(rol_params)
        redirect_to rols_path
         end
  end

  # DELETE /rols/1
  # DELETE /rols/1.json
  def destroy
    @rol.destroy
    respond_to do |format|
      format.html { redirect_to rols_url, notice: 'Rol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def delete_roles
    Rol.where(:id => params[:rol_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to rols_path }
    format.json { head :no_content }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol
      @rol = Rol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rol_params
      params.require(:rol).permit(:admin_user, :user_id, :configuracion, :report_ver, :report_crear, :report_edit, :report_delete, :name,:report_rols,:report_procesos,:default)
    end
end
