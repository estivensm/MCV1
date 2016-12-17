class EmployedsController < ApplicationController
  before_action :set_employed, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token  
  # GET /employeds
  # GET /employeds.json
  def index
    @employeds = Employed.where(admin_user: current_user.id)
  end

  # GET /employeds/1
  # GET /employeds/1.json
  def show
  end

  # GET /employeds/new
  def new
    @employed = Employed.new
  end

  # GET /employeds/1/edit
  def edit
  end

  # POST /employeds
  # POST /employeds.json
  def create
    @employed = Employed.new(employed_params)

    
      if @employed.save
       redirect_to employeds_path
    
    end
  end

  # PATCH/PUT /employeds/1
  # PATCH/PUT /employeds/1.json
  def update

      if @employed.update(employed_params)
        redirect_to employed_path(@employed)
      end
    
  end

  # DELETE /employeds/1
  # DELETE /employeds/1.json
  def destroy
    @employed.destroy
    respond_to do |format|
      format.html { redirect_to employeds_url, notice: 'Employed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employed
      @employed = Employed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employed_params
      params.require(:employed).permit(:first_name, :second_name, :first_last_name, :second_last_name, :document_type, :document, :birth_date, :genero, :admin_user, :user_id, :avatare, :cargo_id)
    end
end
