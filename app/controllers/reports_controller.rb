class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  
respond_to :json
  def get_reportsc
    user = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).take
    @task = Report.where( employed_id: user.id)
    events = []
    @task.each do |task|
      if task.contador_seg > 5
        @color = "green"
      elsif task.contador_seg <= 5 && task.contador_seg >= 0
          @color = "red"
      else
          @color = "orange"
    end
      events << {:id => task.id, :title => "#{task.name} ", :start => "#{task.f_compromiso}" , :color => "#{@color}"}
    end
    render :text => events.to_json

end


def reports_calendar

    
end



















def abiertos
    
   
   if params[:search]
     @reports1 = Report.where(state: "Abierto").search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5])
  else
     @reports1 = Report.all.where(state: "Abierto")
  end

  if current_user.role ==  "Basico" && !current_user.rol.report_ver && !current_user.rol.report_procesos
                
                #a = Employed.where(email: current_user.email).take

                #@reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).where(employed_id: a.id ).order(created_at: :desc)
              redirect_to :back
              
            elsif current_user.role ==  "Basico" && !current_user.rol.report_ver && current_user.rol.report_procesos

                    a = Employed.where(email: current_user.email).take

                #@reports2 = @reports1.where(admin_user: current_user.admin_user).where(proceso_id: a.cargo.proceso_id ).or(Report.where(employed_id: a.id )).order(created_at: :desc)
                @reports2 = @reports1.where(admin_user: current_user.admin_user).where(proceso_id: a.cargo.proceso_id ).order(created_at: :desc)
                @reports = @reports2.paginate(page: params[:page],:per_page => 10)
                @route = reports_abiertos_path

   
    
    
    render 'index'
              else
                    @reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(created_at: :desc)
@route = reports_abiertos_path

   
    
    
    render 'index'
              end



  
end

  def index

    


    
       
              @es = Source.where({default: true, admin_user: current_user.admin_user}).first
              
              if params[:search]
                   @reports1 = Report.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5])
              else
                   @reports1 = Report.all
              end


              if current_user.role ==  "Basico" && !current_user.rol.report_ver && !current_user.rol.report_procesos
                
                 #a = Employed.where(email: current_user.email).take

                #@reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).where(employed_id: a.id ).order(created_at: :desc)
                redirect_to reports_path
              
            elsif current_user.role ==  "Basico" && !current_user.rol.report_ver && current_user.rol.report_procesos

                    a = Employed.where(email: current_user.email).take

                #@reports2 = @reports1.where(admin_user: current_user.admin_user).where(proceso_id: a.cargo.proceso_id ).or(Report.where(employed_id: a.id )).order(created_at: :desc)
                @reports2 = @reports1.where(admin_user: current_user.admin_user).where(proceso_id: a.cargo.proceso_id ).order(created_at: :desc)
                @reports = @reports2.paginate(page: params[:page],:per_page => 10)
                
              else
                    @reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(created_at: :desc)

              end

                  @route = reports_path  

      


  end



def cerrados
    
   if params[:search] 
     @reports1 = Report.where(state: "Cerrado").search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5])
  else
     @reports1 = Report.all.where(state: "Cerrado")
  end

  if current_user.role ==  "Basico" && !current_user.rol.report_ver && !current_user.rol.report_procesos
                
                #a = Employed.where(email: current_user.email).take

                #@reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).where(employed_id: a.id ).order(created_at: :desc)
                redirect_to reports_path
              
            elsif current_user.role ==  "Basico" && !current_user.rol.report_ver && current_user.rol.report_procesos

                    a = Employed.where(email: current_user.email).take

                #@reports2 = @reports1.where(admin_user: current_user.admin_user).where(proceso_id: a.cargo.proceso_id ).or(Report.where(employed_id: a.id )).order(created_at: :desc)
                @reports2 = @reports1.where(admin_user: current_user.admin_user).where(proceso_id: a.cargo.proceso_id ).order(created_at: :desc)
                @reports = @reports2.paginate(page: params[:page],:per_page => 10)
                
              else
                    @reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(created_at: :desc)

              end


@route = reports_cerrados_path
    
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
    @accion_eficaz = @report.accions.where(eficaz: true).count
    @accion_noeficaz = @report.accions.where(eficaz: false).count
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
    @user = Employed.where(email: current_user.email).first
    @es = Source.where({default: true, admin_user: current_user.admin_user}).first
    
  end

  # GET /reports/1/edit
  def edit

    @user = Employed.where(email: current_user.email).first
    @es = Source.where({default: true, admin_user: current_user.admin_user}).first

  end

  # POST /reports
  # POST /reports.json
  def create
   
    
    @user = Employed.where(email: current_user.email).first
    @report = Report.new(report_params)
    @es = Source.where({default: true, admin_user: current_user.admin_user}).first
    @report.state = "Abierto"
    num = Report.where(admin_user: current_user.admin_user).where(source_id: @report.source_id).maximum(:contador)
    if num != nil
        num = num + 1

    else
        num = 1001
    end
    ano = Time.now.year.to_s
    ano = ano.remove("20") 
    source = Source.find(@report.source_id).codigo
    code= "#{source}-#{num}-#{ano}" 
    @report.codigo = code
    @report.contador = num
    @report.costo = 0
    @report.balon = "responsable"
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
     @user = Employed.where(email: current_user.email).first
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



   def set_contacts
        

        @contacts = Contact.where(clinte_proveedor_id: params[:id])
        render :json => @contacts


      end

      def seguimiento
        @report = Report.find(params[:id])
        @seguimientos = @report.rseguimientos.order(created_at: :desc)

      end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit( :employed_id, :proceso_id, :description, :requisito, :evidencia, :nc_type, :accion, :justificacion, :user_id, :admin_user,:state,:codigo,:contador , :source_id,:archivo, :employed_reporta, :f_seguimiento, :f_compromiso, :fp_seguimiento, :f_real,:clinte_proveedor_id,:contact_id,:contador_seg,:costo,:name, :tag ,:cierra_id, :employed_ids => [], :numeral_ids => [])
    end
end
