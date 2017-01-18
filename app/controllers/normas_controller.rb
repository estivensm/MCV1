class NormasController < ApplicationController
  before_action :set_norma, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token  
  

  # GET /normas
  # GET /normas.json
  def index
    if current_user.rol ==  "SuperAdmin" || current_user.rol ==  "Admin"
   
   if params[:search]
     @normas1 = Norma.search(params[:search])
  else
     @normas1 =Norma.all
  end



   @normas = @normas1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user)
    else
      redirect_to root_path
  end
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
