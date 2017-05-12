class CargosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cargo, only: [:show, :edit, :update, :destroy]
  before_action :configuracion

  # GET /cargos
  # GET /cargos.json
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path
    end
    
  end


  def index
   
   
   if params[:search] || params[:search1] || params[:search2]

     @cargos1 = Cargo.where(admin_user: current_user.admin_user).search(params[:search], params[:search1], params[:search2])
  else

     @cargos1 = Cargo.where(admin_user: current_user.admin_user)
  end



   @cargos = @cargos1.paginate(page: params[:page],:per_page => 20)
   
  end




  # GET /cargos/1
  # GET /cargos/1.json
  def show
  end

  # GET /cargos/new
  def new

    @cargo = Cargo.new
    @procesos = Proceso.where(admin_user: current_user.id)
    @users = User.all
  end

  # GET /cargos/1/edit
  def edit
     @procesos = Proceso.where(admin_user: current_user.id)
  end

  # POST /cargos
  # POST /cargos.json
  def create
   
    @cargo = Cargo.new(cargo_params)

    
      if @cargo.save
       
        redirect_to cargos_path
        
      end
    
  end

  # PATCH/PUT /cargos/1
  # PATCH/PUT /cargos/1.json
  def update
     @procesos = Proceso.all
      if @cargo.update(cargo_params)
        redirect_to cargos_path, notice: 'Cargo was successfully updated.'
       
      
      end


    
  end

   def set_cargos
        cargo = Cargo.find(params[:id])

        @users = Employed.where(cargo_id: cargo.id)
        render :json => @users


      end

  # DELETE /cargos/1
  # DELETE /cargos/1.json
  def destroy
    @cargo.destroy
    respond_to do |format|
      format.html { redirect_to cargos_url, notice: 'Cargo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


def delete_cargos
    Cargo.where(:id => params[:cargo_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to cargos_path }
    format.json { head :no_content }
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargo
      @cargo = Cargo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cargo_params
      params.require(:cargo).permit(:name, :description, :proceso_id,:user_id, :admin_user, :cargo_id )
    end
end
