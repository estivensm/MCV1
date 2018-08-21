class RseguimientosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rseguimiento, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /rseguimientos
  # GET /rseguimientos.json
  def index
    
    @report = Report.find(params[:report_id]) 
    @seguimientos = @report.rseguimientos
    @responsables = @report.employeds
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @actividad = Accion.where(report_id: @report.id).where(tipo: "Actividad").count
    @accions = Accion.where(report_id: @report.id)
    @menu_accion = ["","",""]
    @seguimientosa = []
    @accions.each do |accion|
       accion.aseguimientos.each do |seg| 
        
        @seguimientosa << seg

       end 

    end

   
       @seguimientos.each do |seg| 
        
         @seguimientosa << seg

       end 

    

   @seguimientos_t =  @seguimientosa

    @tasks = Task.where(report_id: @report.id)
    @cliente_proveedors1 = ClinteProveedor.where(admin_user: current_user.admin_user).order(created_at: :desc)
    render :layout => "admin_report"
  end

  # GET /rseguimientos/1
  # GET /rseguimientos/1.json
  def show
  end

  # GET /rseguimientos/new
  def new
    @rseguimiento = Rseguimiento.new
    @report = Report.find(params[:report_id]) 
    @gestion_c = @report.accions.abiertas.count
  end

  # GET /rseguimientos/1/edit
  def edit
     @report = Report.find(params[:report_id]) 
  end

  # POST /rseguimientos
  # POST /rseguimientos.json
  def create
    @report = Report.find(params[:report_id])
    @seguimientos = @report.rseguimientos
    @rseguimiento = Rseguimiento.new(rseguimiento_params)
    @accions = Accion.where(report_id: @report.id)
    @seguimientosa = []
    

    if @rseguimiento.save
         @accions.each do |accion|
       accion.aseguimientos.each do |seg| 
        
        @seguimientosa << seg

       end 

    end

   
       @seguimientos.each do |seg| 
        
         @seguimientosa << seg

       end 
      
    end
 
    
  end

  # PATCH/PUT /rseguimientos/1
  # PATCH/PUT /rseguimientos/1.json
  def update
     @report = Report.find(params[:report_id]) 
      if @rseguimiento.update(rseguimiento_params)
        if params[:remove_evidencia]
        @rseguimiento.remove_evidencia!
        @rseguimiento.save
      end
       
        


      end
    
 
  end

  # DELETE /rseguimientos/1
  # DELETE /rseguimientos/1.json
  def destroy
     @report = Report.find(params[:report_id])
     @seguimientos = @report.rseguimientos
     @accions = Accion.where(report_id: @report.id)
     @report = Report.find(params[:report_id]) 
     @seguimientosa = []
      if @rseguimiento.destroy
          
         @accions.each do |accion|
       accion.aseguimientos.each do |seg| 
        
        @seguimientosa << seg

       end 

    end

   
       @seguimientos.each do |seg| 
        
         @seguimientosa << seg

       end 


      end
     end
    


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rseguimiento
      @rseguimiento = Rseguimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rseguimiento_params
      params.require(:rseguimiento).permit(:user_id, :admin_user, :f_seguimiento, :descripcion, :report_id, :evidencia,:s_cierre,:cerrar,:eficaz,:conclucion, :remove_evidencia)
    end
end
