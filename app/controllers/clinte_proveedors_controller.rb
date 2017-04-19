class ClinteProveedorsController < ApplicationController
  before_action :set_clinte_proveedor, only: [:show, :edit, :update, :destroy]
      before_action :configuracion

  
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path

        
    end
    
  end


   def import
  ClinteProveedor.import(params[:file], current_user.admin_user, current_user.admin_user )
  redirect_to clinte_proveedors_path, notice: "Los Registros fueron importados Exitosamente"
end





  # GET /clinte_proveedors
  # GET /clinte_proveedors.json
  def index
   if params[:search]
     @clinte_proveedors1 = ClinteProveedor.where(tipo: "Cliente").search(params[:search],params[:search1],params[:search2]).order(created_at: :desc)
  else
     @clinte_proveedors1 = ClinteProveedor.where(tipo: "Cliente")
  end


    @route = clinte_proveedors_path    
    @title = "Clientes"
   @clinte_proveedors = @clinte_proveedors1.paginate(page: params[:page],:per_page => 50).where(admin_user: current_user.admin_user)
    
  end

def proveedores
   if params[:search]
     @clinte_proveedors1 = ClinteProveedor.where(tipo: "Proveedor").search(params[:search],params[:search1],params[:search2]).order(created_at: :desc)
  else
     @clinte_proveedors1 = ClinteProveedor.where(tipo: "Proveedor")
  end 




   @clinte_proveedors = @clinte_proveedors1.paginate(page: params[:page],:per_page => 50).where(admin_user: current_user.admin_user)
    @route = proveedores_path  
    @title = "Proveedores"  
    render "index"

  end


  def entidades_gubernamentales
   if params[:search]
     @clinte_proveedors1 = ClinteProveedor.where(tipo: "Entidad Gubernamental").search(params[:search],params[:search1],params[:search2]).order(created_at: :desc)
  else
     @clinte_proveedors1 = ClinteProveedor.where(tipo: "Entidad Gubernamental")
  end 




   @clinte_proveedors = @clinte_proveedors1.paginate(page: params[:page],:per_page => 50).where(admin_user: current_user.admin_user)
    @route = entidades_gubernamentales_path 
    @title = "Entidades Gubernamentales"   
    render "index"

  end

    def entidades_certificacion
   if params[:search]
     @clinte_proveedors1 = ClinteProveedor.where(tipo: "Entidad de Certificación").search(params[:search],params[:search1],params[:search2]).order(created_at: :desc)
  else
     @clinte_proveedors1 = ClinteProveedor.where(tipo: "Entidad de Certificación")
  end 




   @clinte_proveedors = @clinte_proveedors1.paginate(page: params[:page],:per_page => 50).where(admin_user: current_user.admin_user)
    @route = entidades_certificacion_path    
    @title = "Entidades de Certificación"
    render "index"

  end



  # GET /clinte_proveedors/1
  # GET /clinte_proveedors/1.json
  def show
  end

  # GET /clinte_proveedors/new
  def new
    @clinte_proveedor = ClinteProveedor.new
  end

  # GET /clinte_proveedors/1/edit
  def edit
  end

  # POST /clinte_proveedors
  # POST /clinte_proveedors.json
  def create
   @clinte_proveedor = ClinteProveedor.new(clinte_proveedor_params)
    if @clinte_proveedor.save

      if @clinte_proveedor.tipo == "Cliente"
        redirect_to clinte_proveedors_path
        elsif @clinte_proveedor.tipo == "Proveedor"
          redirect_to proveedores_path
           elsif @clinte_proveedor.tipo == "Entidad Gubernamental"
          redirect_to entidades_gubernamentales_path
           elsif @clinte_proveedor.tipo == "Entidad de Certificación"
          redirect_to entidades_certificacion_path
      end
    end
  end

  # PATCH/PUT /clinte_proveedors/1
  # PATCH/PUT /clinte_proveedors/1.json
  def update
    
   if @clinte_proveedor.update(clinte_proveedor_params)

        redirect_to clinte_proveedors_path
         end
  end

  # DELETE /clinte_proveedors/1
  # DELETE /clinte_proveedors/1.json
  def destroy
    @clinte_proveedor.destroy
    respond_to do |format|
      format.html { redirect_to clinte_proveedors_url, notice: 'Clinte proveedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def delete_clientes
    ClinteProveedor.where(:id => params[:cliente_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to clinte_proveedors_path }
    format.json { head :no_content }
  end
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinte_proveedor
      @clinte_proveedor = ClinteProveedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinte_proveedor_params
      params.require(:clinte_proveedor).permit(:user_id, :admin_user, :name, :pbx, :address, :nit, :correo_empresa, :contact_name, :contact_telephone, :contact_email, :tipo, :web, contacts_attributes: [:id, :name, :mobil,:email,:clinte_proveedor_id,:cargo,:user_id,:admin_user, :_destroy])
    end
end
