class SourcesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_source, only: [:show, :edit, :update, :destroy]
  before_action :configuracion

  
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path
    end
    
  end
  
  # GET /sources
  # GET /sources.json
  def index




   if params[:search] || params[:search1]  || params[:search2] 
     @sources1 = Source.where(admin_user: current_user.admin_user).search(params[:search], params[:search1], params[:search2])
  else
      @ja = nil
     @sources1 = Source.where(admin_user: current_user.admin_user)
  end



   @sources = @sources1.paginate(page: params[:page],:per_page => 20).order(created_at: :desc)
   
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
  end

  # GET /sources/new
  def new
    @source = Source.new
  end

  # GET /sources/1/edit
  def edit
  end

  # POST /sources
  # POST /sources.json
  def create
    @source = Source.new(source_params)
    if @source.save
        redirect_to sources_path
    end
  end

  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    if @source.update(source_params)
        redirect_to sources_path
         end
  end

def change
  
    @source1 = Source.where(admin_user: current_user.admin_user)
    @source1.update_all(default: false)
    @source = Source.find(params[:id]).update(default: true)

    if params[:search] && params[:search] != "$%$" 
     
     @sources1 = Source.search(params[:search])
  else
     @sources1 = Source.all
  end



   @sources = @sources1.paginate(page: params[:page],:per_page => 20).where(admin_user: current_user.admin_user).order(created_at: :desc)
    
    
end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source.destroy
    respond_to do |format|
      format.html { redirect_to sources_url, notice: 'Source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def delete_sources
    Source.where(:id => params[:source_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to sources_path }
    format.json { head :no_content }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_params
      params.require(:source).permit(:name, :description, :user_id, :admin_user, :state, :accion, :correccion, :causa,:task, :actividad,:puede_ac,:tipo,:codigo,:balon, :evidencia, :requisito, :numerales)
    end
end



















