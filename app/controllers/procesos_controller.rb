class ProcesosController < ApplicationController
 before_action :authenticate_user!
  before_action :set_proceso, only: [:show, :edit, :update, :destroy]
    before_action :configuracion

  
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path

        
    end
    
  end

  # GET /procesos
  # GET /procesos.json
  def index

 
    
   
   if params[:search] || params[:search1]
     @procesos1 = Proceso.where(admin_user: current_user.admin_user).search(params[:search], params[:search1])
  else
     @procesos1 = Proceso.where(admin_user: current_user.admin_user)
  end



   @procesos = @procesos1.paginate(page: params[:page],:per_page => 30)
    

  end

  # GET /procesos/1
  # GET /procesos/1.json
  def show

    
    @reports = Report.where(proceso_id: @proceso.id)
    @accions = Accion.joins(:report).where(:reports => {:proceso_id  => @proceso.id} )
    @tasksd = Task.joins(:report).where(:reports => {:proceso_id  => @proceso.id} )
    @reports.cerrados.count != 0 ? @divr = @reports.cerrados.count : @divr = 1  
    @accions.cerradas.count != 0 ? @diva = @accions.cerradas.count : @diva = 1   
    #@accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1 
    @tasksd.cerradas.count != 0 ? @divt = @tasksd.cerradas.count : @divt = 1  
    
      
    
    @rabiertos = @reports.abiertos.count 
    @racumplio =    @reports.abiertos.where("contador_seg >= ?" ,1).count 
    @ranocumplio =    @reports.abiertos.where("contador_seg < ?" ,1).count 
    @rcerrados =    @reports.cerrados.count 
    @rcumplio =    @reports.cerrados.where(cumplio: true).count 
    @rnocumplio =    @reports.cerrados.where(cumplio: false).count 
    @rporcentaje=    ((@reports.cerrados.where(cumplio: true).count.to_f/@divr)*100).to_i 
      
    #@correcciones =      @accions.where(tipo: "Correcion").count 
    #@canocumplio =     @accions.abiertas.where(tipo: "Correcion").where("contador_seg < ?" ,1).count 
    #@cacumplio =    @accions.abiertas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count 
    #@cabiertas =      @accions.abiertas.where(tipo: "Correcion").count 
    #@ccerradas =     @accions.cerradas.where(tipo: "Correcion").count 
    #@cnocumplio =     @accions.cerradas.where(tipo: "Correcion").where("contador_seg < ?" ,1).count 
    #@ccumplio =    @accions.cerradas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count 
     #@cporcentaje =  ((@accions.cerradas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count.to_f/ @divc)*100).to_i 

      @acciones =   @accions.count 
      @aabiertas=   @accions.abiertas.count 
      @aanocumplio =   @accions.abiertas.where("accions.contador_seg < ?" ,1).count 
      @aacumplio =   @accions.abiertas.where("accions.contador_seg >= ?" ,1).count 
      @acerradas=  @accions.cerradas.count 
      @anocumplio =   @accions.cerradas.where(cumplio: false).count 
      @acumplio =   @accions.cerradas.where(cumplio: true).count 
      @aporcentaje = ((@accions.cerradas.where(cumplio: true).count.to_f/ @diva)*100).to_i 
     
      @tasks =  @tasksd .count 
      @tabiertas =  @tasksd .abiertas.count 
      @tanocumplio =  @tasksd.abiertas.where("tasks.contador_seg < ?" ,1).count 
      @tacumplio =  @tasksd.abiertas.where("tasks.contador_seg >= ?" ,1).count 
      @tcerradas =   @tasksd.cerradas.count 
      @tnocumplio =  @tasksd.cerradas.where(cumplio: false).count 
      @tcumplio =  @tasksd.cerradas.where(cumplio: true).count 
      @tporcentaje = ((@tasksd.cerradas.where(cumplio: true).count.to_f/@divt)*100).to_i
      

     
      

      @total1 = @reports.count + @acciones + @tasks
      @total2 = @racumplio  + @aacumplio + @tacumplio
      @total3 = @ranocumplio  + @aanocumplio + @tanocumplio
      @total4 = @rabiertos + @aabiertas + @tabiertas
      @total5 = @rcumplio  + @acumplio + @tcumplio
      @total6 = @rnocumplio  + @anocumplio + @tnocumplio
      @total7 = @rcerrados + @acerradas + @tcerradas

      @total8 = @total7 == 0 ? ((@total5.to_f/@total7.to_f)*100) : ((@total5.to_f/@total7.to_f)*100).to_i 

        

  end

  # GET /procesos/new
  def new
    @proceso = Proceso.new
  end

  # GET /procesos/1/edit
  def edit
  end

  # POST /procesos
  # POST /procesos.json
  def create
    @proceso = Proceso.new(proceso_params)
    if @proceso.save
        redirect_to procesos_path
    end
    
  end

  # PATCH/PUT /procesos/1
  # PATCH/PUT /procesos/1.json
  def update
    
      if @proceso.update(proceso_params)
        redirect_to procesos_path
         end
  end

  # DELETE /procesos/1
  # DELETE /procesos/1.json
  def destroy
    @proceso.destroy
    respond_to do |format|
      format.html { redirect_to procesos_url, notice: 'Proceso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def delete_procesos
    Proceso.where(:id => params[:proceso_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to procesos_path }
    format.json { head :no_content }
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceso
      @proceso = Proceso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proceso_params
      params.require(:proceso).permit!
    end
end
