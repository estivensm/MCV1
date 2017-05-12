class SourceParentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_source_parent, only: [:show, :edit, :update, :destroy]
  before_action :configuracion

  
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path

        
    end
    
  end
  # GET /source_parents
  # GET /source_parents.json
  def index
    @source_parents = SourceParent.all


   if params[:search] || params[:search1]
     @source_parents1 = SourceParent.where(admin_user: current_user.admin_user).search(params[:search], params[:search1])
  else
     @source_parents1 = SourceParent.where(admin_user: current_user.admin_user)
  end



   @source_parents = @source_parents1.paginate(page: params[:page],:per_page => 30)
  end

  # GET /source_parents/1
  # GET /source_parents/1.json
  def show
  end

  # GET /source_parents/new
  def new
    @source_parent = SourceParent.new
  end

  # GET /source_parents/1/edit
  def edit
  end

  # POST /source_parents
  # POST /source_parents.json
  def create
  
  @source_parent = SourceParent.new(source_parent_params)
    if @source_parent.save
        redirect_to source_parents_url
    end
  end

  # PATCH/PUT /source_parents/1
  # PATCH/PUT /source_parents/1.json
  def update
     if @source_parent.update(source_parent_params)
        redirect_to source_parents_url
         end
  end

  # DELETE /source_parents/1
  # DELETE /source_parents/1.json
  def destroy
    @source_parent.destroy
    respond_to do |format|
      format.html { redirect_to source_parents_url, notice: 'Source parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def delete_source_parent
    SourceParent.where(:id => params[:source_parent_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to source_parents_path }
    format.json { head :no_content }
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_parent
      @source_parent = SourceParent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_parent_params
      params.require(:source_parent).permit(:name, :description, :user_id, :admin_user, :codigo, :tipo)
    end
end
