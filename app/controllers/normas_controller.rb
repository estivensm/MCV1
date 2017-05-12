class NormasController < ApplicationController
before_action :authenticate_user!
  before_action :set_norma, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token  
    before_action :configuracion

  
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path
    end
    
  end
  

  # GET /normas
  # GET /normas.json
  def index
   
   
   if params[:search]
     @normas1 = Norma.where(admin_user: current_user.admin_user).search(params[:search])
  else
     @normas1 =Norma.where(admin_user: current_user.admin_user).or(Norma.where(tipo:true))
  end



   @normas = @normas1.paginate(page: params[:page],:per_page => 30)
    
  end

  # GET /normas/1
  # GET /normas/1.json
  def show
  end

  # GET /normas/new
  def new
    @norma = Norma.new
  end

  # GET /normas/1/edit
  def edit
  end

  # POST /normas
  # POST /normas.json
  def create
    @norma = Norma.new(norma_params)
    if @norma.save
        redirect_to normas_path
    end
  end

  # PATCH/PUT /normas/1
  # PATCH/PUT /normas/1.json
  def update
     if @norma.update(norma_params)
        redirect_to normas_path
         end
  end

  # DELETE /normas/1
  # DELETE /normas/1.json
  def destroy
    @norma.destroy
    respond_to do |format|
      format.html { redirect_to normas_url, notice: 'Norma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_normas
    Norma.where(:id => params[:norma_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to normas_path }
    format.json { head :no_content }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_norma
      @norma = Norma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def norma_params
      params.require(:norma).permit(:name, :user_id, :admin_user, :archivo, :link)
    end
end
