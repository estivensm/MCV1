class ClinteProveedorsController < ApplicationController
  before_action :set_clinte_proveedor, only: [:show, :edit, :update, :destroy]

  # GET /clinte_proveedors
  # GET /clinte_proveedors.json
  def index
    @clinte_proveedors = ClinteProveedor.all
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
        redirect_to clinte_proveedors_path
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
