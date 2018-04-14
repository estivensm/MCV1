class ClienteProveedorTypesController < ApplicationController
  before_action :set_cliente_proveedor_type, only: [:show, :edit, :update, :destroy]

  # GET /cliente_proveedor_types
  # GET /cliente_proveedor_types.json
  def index
    @cliente_proveedor_types = ClienteProveedorType.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 30)
  end

  # GET /cliente_proveedor_types/1
  # GET /cliente_proveedor_types/1.json
  def show
  end

  # GET /cliente_proveedor_types/new
  def new
    @cliente_proveedor_type = ClienteProveedorType.new
    
  end

  # GET /cliente_proveedor_types/1/edit
  def edit
  end

  # POST /cliente_proveedor_types
  # POST /cliente_proveedor_types.json
  def create
    @cliente_proveedor_type = ClienteProveedorType.new(cliente_proveedor_type_params)

    respond_to do |format|
      if @cliente_proveedor_type.save
        format.html { redirect_to cliente_proveedor_types_url, notice: 'Cliente proveedor type was successfully created.' }
        format.json { render :show, status: :created, location: @cliente_proveedor_type }
      else
        format.html { render :new }
        format.json { render json: @cliente_proveedor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cliente_proveedor_types/1
  # PATCH/PUT /cliente_proveedor_types/1.json
  def update
    respond_to do |format|
      if @cliente_proveedor_type.update(cliente_proveedor_type_params)
        format.html { redirect_to cliente_proveedor_types_url, notice: 'Cliente proveedor type was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente_proveedor_type }
      else
        format.html { render :edit }
        format.json { render json: @cliente_proveedor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cliente_proveedor_types/1
  # DELETE /cliente_proveedor_types/1.json
  def destroy
    @cliente_proveedor_type.destroy
    respond_to do |format|
      format.html { redirect_to cliente_proveedor_types_url, notice: 'Cliente proveedor type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente_proveedor_type
      @cliente_proveedor_type = ClienteProveedorType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_proveedor_type_params
      params.require(:cliente_proveedor_type).permit(:admin_user, :user_id, :name, :description)
    end
end
