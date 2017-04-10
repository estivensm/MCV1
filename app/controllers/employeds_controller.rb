class EmployedsController < ApplicationController
  before_action :set_employed, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token  
    before_action :configuracion

  
  
  def import
  Employed.import(params[:file], current_user.admin_user, current_user.admin_user )
  redirect_to employeds_path, notice: "Empleados Importados"
end




  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path
    end
    
  end
  # GET /employeds
  # GET /employeds.json
  def index
     
   
   if params[:search] || params[:search1] || params[:search2] || params[:search3]
     @employeds1 = Employed.where(admin_user: current_user.admin_user).search(params[:search],params[:search1],params[:search2],params[:search3])
  else
     @employeds1 = Employed.where(admin_user: current_user.admin_user)
  end



   @employeds = @employeds1.paginate(page: params[:page],:per_page => 30)
   

  end

  # GET /employeds/1
  # GET /employeds/1.json
  def show
    @reports = Report.where(employed_id: @employed.id)
    @accions = Accion.where(employed_id: @employed.id)
    @tasksd = @employed.tasks
    @reports.cerrados.count != 0 ? @divr = @accions.cerrados.count : @divr = 1  
    @accions.cerradas.where(tipo: "Accion").count != 0 ? @diva = @accions.cerradas.where(tipo: "Accion").count : @diva = 1   
    @accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1 
    @tasksd.cerradas.count != 0 ? @divt = @tasksd.cerradas.count : @divt = 1  
    
      
    
    @rabiertos = @reports.abiertos.count 
    @rcerrados =    @reports.cerrados.count 
    @rcumplio =    @reports.cerrados.where("contador_seg >= ?" ,1).count 
    @rnocumplio =    @reports.cerrados.where("contador_seg < ?" ,1).count 
    @rporcentaje=    ((@reports.cerrados.where("contador_seg >= ?" ,1).count/@divr)*100).to_i 
      
    @correcciones =      @accions.where(tipo: "Correcion").count 
    @cabiertas =      @accions.abiertas.where(tipo: "Correcion").count 
    @ccerradas =     @accions.cerradas.where(tipo: "Correcion").count 
    @cnocumplio =     @accions.cerradas.where(tipo: "Correcion").where("contador_seg < ?" ,1).count 
    @ccumplio =    @accions.cerradas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count 
     @cporcentaje =  ((@accions.cerradas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count/ @divc)*100).to_i 

      @acciones =   @accions.where(tipo: "Accion").count 
      @aabiertas=   @accions.abiertas.where(tipo: "Accion").count 
      @acerradas=  @accions.cerradas.where(tipo: "Accion").count 
      @anocumplio =   @accions.cerradas.where(tipo: "Accion").where("contador_seg < ?" ,1).count 
      @acumplio =   @accions.cerradas.where(tipo: "Accion").where("contador_seg >= ?" ,1).count 
      @aporcentaje = ((@accions.cerradas.where(tipo: "Accion").where("contador_seg >= ?" ,1).count/ @diva)*100).to_i 
     
      @tasks =  @employed.tasks.count 
      @tabiertas =  @employed.tasks.abiertas.count 
      @tcerradas =   @employed.tasks.cerradas.count 
      @tnocumplio =  @employed.tasks.cerradas.where("contador_seg < ?" ,1).count 
      @tcumplio =  @employed.tasks.cerradas.where("contador_seg >= ?" ,1).count 
      @tporcentaje = ((@employed.tasks.cerradas.where("contador_seg >= ?" ,1).count/@divt)*100).to_i

      @total1 = @reports.count + @correcciones + @acciones + @tasks
      @total2 = @rabiertos + @cabiertas + @aabiertas + @tabiertas
      @total3 = @rcerrados+ @ccerradas + @acerradas + @tcerradas
      @total4 = @rcumplio + @ccumplio + @acumplio + @tcumplio
      @total5 = @rnocumplio +@cnocumplio + @anocumplio + @tnocumplio
      @total6 = @rporcentaje +@cporcentaje + @aporcentaje + @tporcentaje
   


   
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

def delete_employeds
    Employed.where(:id => params[:employed_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to employeds_path }
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
      params.require(:employed).permit(:first_name, :second_name, :first_last_name, :second_last_name, :document_type, :document, :birth_date, :genero, :admin_user, :user_id, :avatare, :cargo_id, :email)
    end
end
