class NumeralsController < ApplicationController
  before_action :set_numeral, only: [:show, :edit, :update, :destroy]
    before_action :configuracion

  
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path
    end
    
  end

  # GET /numerals
  # GET /numerals.json
  def index
    @norma = Norma.find(params[:norma_id])
     if current_user.role ==  "SuperAdmin" || current_user.role ==  "Admin"
   
   if params[:search]
     @numerals1 = @norma.numerals.search(params[:search])
  else
     @numerals1 =@norma.numerals
  end



   @numerals = @numerals1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user)
    else
      redirect_to root_path
  end
  end

  # GET /numerals/1
  # GET /numerals/1.json
  def show
    @norma = Norma.find(params[:norma_id])
  end

  # GET /numerals/new
  def new
    @norma = Norma.find(params[:norma_id])
    @numeral = Numeral.new
  end

  # GET /numerals/1/edit
  def edit
    @norma = Norma.find(params[:norma_id])
  end

  # POST /numerals
  # POST /numerals.json
  def create
    @numeral = Numeral.new(numeral_params)
    if @numeral.save
        redirect_to norma_numerals_path(@numeral.norma_id)
    end
  end

  # PATCH/PUT /numerals/1
  # PATCH/PUT /numerals/1.json
  def update
  if @numeral.update(numeral_params)
        redirect_to norma_numerals_path(@numeral.norma_id)
    end
        
  end

  # DELETE /numerals/1
  # DELETE /numerals/1.json
  def destroy
    @numeral.destroy
    respond_to do |format|
      format.html { redirect_to norma_numerals_path(@numeral.norma_id), notice: 'Numeral was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_numeral
      @numeral = Numeral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def numeral_params
      params.require(:numeral).permit(:name, :user_id, :admin_user, :norma_id, :description, :numeral, :norma_name)
    end
end
