class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  
def abiertos
    if current_user.rol ==  "SuperAdmin" || current_user.rol ==  "Admin" || current_user.rol ==  "Basico"
   
   if params[:search]
     @reports1 = Report.where(state: "Abierto").search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6])
  else
     @reports1 = Report.all.where(state: "Abierto")
  end

  @route = reports_abiertos_path

   @reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(created_at: :desc)
    else
      redirect_to root_path
  end
    
    
    render 'index'
end

  def index

    


 
    if current_user.rol ==  "SuperAdmin" || current_user.rol ==  "Admin" || current_user.rol ==  "Basico"
   @es = Source.where({default: true, admin_user: current_user.admin_user}).first
   if params[:search]
     @reports1 = Report.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6])
  else
     @reports1 = Report.all
  end


  if current_user.rol ==  "Basico"
    
    a = Employed.where(email: current_user.email).take.id
    @reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).where(employed_id: a ).order(created_at: :desc)
    
  else
        @reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(created_at: :desc)

  end

    @route = reports_path  

    else
      redirect_to root_path
  end


  end



def cerrados
    if current_user.rol ==  "SuperAdmin" || current_user.rol ==  "Admin" || current_user.rol ==  "Basico"
   
   if params[:search] 
     @reports1 = Report.where(state: "Cerrado").search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6])
  else
     @reports1 = Report.all.where(state: "Cerrado")
  end


@route = reports_cerrados_path
   @reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(created_at: :desc)
    else
      redirect_to root_path
  end
    render 'index'
end

def acciones

end




  # GET /reports/1
  # GET /reports/1.json
  def show
    @responsables = @report.employeds
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").where(estado: "Abierta").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").where(estado: "Cerrada").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").where(estado: "Abierta").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").where(estado: "Cerrada").count
    @accions = Accion.where(report_id: @report.id)
    @seguimientos = @report.rseguimientos
 
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
        :template => 'reports/pdfs/report.pdf.erb',
        :layout => 'pdf.html.erb',
        :header => {
                  :spacing => 5,
                  :html => {
                     :template => 'layouts/pdf_header.html'
                  },

                  },
                  :footer => {
                    :spacing => 5,
                  :html => {
                     :template => 'layouts/pdf_footer.html.erb'
                  }
               },
        :show_as_html => params[:debug].present?
      end
    end
  end

  # GET /reports/new
  def new
    @report = Report.new
    @es = Source.where({default: true, admin_user: current_user.admin_user}).first
    
  end

  # GET /reports/1/edit
  def edit

    
    @es = Source.where({default: true, admin_user: current_user.admin_user}).first

  end

  # POST /reports
  # POST /reports.json
  def create
   

    @report = Report.new(report_params)
    @es = Source.where({default: true, admin_user: current_user.admin_user}).first
    @report.state = "Abierto"
    @num = Report.where(admin_user: current_user.admin_user).maximum(:contador)
    if @num != nil
        @num = @num + 1

    else
        @num = 1001
    end
    @ano = Time.now.year.to_s
    @ano = @ano.remove("20") 
 
    @code= "HALL-#{@num}-#{@ano}" 
    @report.codigo = @code
    @report.contador = @num
    @employed = Employed.find(@report.employed_id)
    respond_to do |format|
      if @report.save
        ReportMailer.noty_report(@employed,@report).deliver
        format.html { redirect_to @report, notice: 'El Reporte fue creado correctamente' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    @es = Source.where({default: true, admin_user: current_user.admin_user}).first
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'El Reporte se actualizo correctamente' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'El Reporte se elimino correctamente' }
      format.json { head :no_content }
    end
  end

  def get_sourcee
      
      @source = Source.find(params[:id]) 
      render :json => @source
  end


def delete_reports

  
    Report.where(:id => params[:report_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to reports_path }
    format.json { head :no_content }
  end
 
end

def cerrar_report
  
  @report1 = Report.find(params[:report])

   @report1.f_compromiso >= Time.now ? (@report1.cumplio = true) : (@report1.cumplio = false)
   @report1.f_real = Time.now 
  
  if @report1.update(justificacion: params[:descripcion], state: "Cerrado" )
    redirect_to @report1
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit( :employed_id, :proceso_id, :description, :requisito, :evidencia, :nc_type, :accion, :justificacion, :user_id, :admin_user,:state,:codigo,:contador , :source_id,:archivo, :employed_reporta, :f_seguimiento, :f_compromiso, :fp_seguimiento, :f_real,:contador_seg,:costo , :employed_ids => [], :numeral_ids => [])
    end
end
