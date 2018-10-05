class ReportsController < ApplicationController
 before_action :authenticate_user!
  before_action :set_report, only: [:show, :edit, :update, :destroy, :show_info, :report_pdf]

  # GET /reports
  # GET /reports.json
  

respond_to :json
  def get_reportodos
    @task = Report.where( admin_user: current_user.admin_user).abiertos
    events = []
    @task.each do |task|
      if task.contador_seg > 5
        @color = "#22c488"
      elsif task.contador_seg <= 5 && task.contador_seg >= 0
          @color = "orange"
      else
          @color = "#d82c2c"
    end
      events << {:id => task.id, :title => "#{task.description} ", :start => "#{task.f_compromiso}" , :color => "#{@color}", :url =>"reports/#{task.id}"}
    end
    puts events.to_json
render :plain => events.to_json
  end 


respond_to :json
  def get_acciontodosi
    @task4 = Accion.where( admin_user: current_user.admin_user).abiertas
    events = []
    @task4.each do |task4|
      if task4.contador_seg > 5
        @color4 = "#22c488"
      elsif task4.contador_seg <= 5 && task4.contador_seg >= 0
          @color4 = "orange"
      else
          @color4 = "#d82c2c"
    end
      events << {:id => task4.id, :title => "#{task4.descripcion} ", :start => "#{task4.f_compromiso}" , :color => "#{@color4}", :url =>"reports/#{task4.report_id}/accions/#{task4.id}"}
    end

        
        render :plain => events.to_json
  end 



respond_to :json
  def get_tasktodos
    @task5 = Task.where( admin_user: current_user.admin_user).abiertas
    events = []
    @task5.each do |task5|
      if task5.contador_seg > 5
        @color5 = "#22c488"
      elsif task5.contador_seg <= 5 && task5.contador_seg >= 0
          @color5 = "orange"
      else
          @color5 = "#d82c2c"
    end
      events << {:id => task5.id, :title => "#{task5.name} ", :start => "#{task5.f_compromiso}" , :color => "#{@color5}", :url =>"reports/#{task5.report_id}/accions/#{task5.id}"}
    end
        render :plain => events.to_json
  end 




  
respond_to :json
  def get_misreportsc
    user = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).take
    @task = Report.where( employed_id: user.id).where(state: "Abierto")
    events = []
    @task.each do |task|
      if task.contador_seg > 5
        @color = "#22c488"
      elsif task.contador_seg <= 5 && task.contador_seg >= 0
          @color = "orange"
      else
          @color = "#d82c2c"
    end
      events << {:id => task.id, :title => "#{task.description} ", :start => "#{task.f_compromiso}" , :color => "#{@color}", :url =>"reports/#{task.id}"}
    end

  end  


respond_to :json
  def get_reportsc
    user = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).take
    @task = Report.where( employed_id: user.id).where(state: "Abierto")
    @task1 = Accion.where( employed_id: user.id).where(estado: "Abierta")
    @task2 = Task.where( employed_id: user.id).where(estado: false)
    events = []
    @task.each do |task|
      if task.contador_seg > 5
        @color = "#22c488"
      elsif task.contador_seg <= 5 && task.contador_seg >= 0
          @color = "orange"
      else
          @color = "#d82c2c"
    end
      events << {:id => task.id, :title => "#{task.description} ", :start => "#{task.f_compromiso}" , :color => "#{@color}", :url =>"reports/#{task.id}"}
    end

    @task1.each do |task1|
      if task1.contador_seg > 5
        @color1 = "#22c488"
      elsif task1.contador_seg <= 5 && task1.contador_seg >= 0
          @color1 = "orange"
      else
          @color1 = "#d82c2c"
    end
      events << {:id => task1.id, :title => "#{task1.descripcion} ", :start => "#{task1.f_compromiso}" , :color => "#{@color1}", :url =>"reports/#{task1.report_id}/accions/#{task1.id}"}
    end

    @task2.each do |task2|
      if task2.contador_seg > 5
        @color2 = "#22c488"
      elsif task2.contador_seg <= 5 && task2.contador_seg >= 0
          @color2 = "orange"
      else
          @color2 = "#d82c2c"
    end
      events << {:id => task2.id, :title => "#{task2.name} ", :start => "#{task2.f_compromiso}" , :color => "#{@color2}", :url =>"reports/#{task2.report_id}/tasks"}
    end
    render :plain => events.to_json

end


respond_to :json
  def get_invitadoc
    user = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).take
    @task = user.reports.where(state: "Abierto")
    @task1 = user.accions.where(estado: "Abierta")
    events = []
    @task.each do |task|
      if task.contador_seg > 5
        @color = "#22c488"
      elsif task.contador_seg <= 5 && task.contador_seg >= 0
          @color = "orange"
      else
          @color = "#d82c2c"
    end
      events << {:id => task.id, :title => "#{task.description} ", :start => "#{task.f_compromiso}" , :color => "#{@color}", :url =>"reports/#{task.id}"}
    end

    @task1.each do |task1|
      if task1.contador_seg > 5
        @color1 = "#22c488"
      elsif task1.contador_seg <= 5 && task1.contador_seg >= 0
          @color1 = "orange"
      else
          @color1 = "#d82c2c"
    end
      events << {:id => task1.id, :title => "#{task1.descripcion} ", :start => "#{task1.f_compromiso}" , :color => "#{@color1}", :url =>"reports/#{task1.report_id}/accions/#{task1.id}"}
    end

    render :plain => events.to_json

end

respond_to :json
  def get_asignadosc
    user = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).take
    @task = Report.where( employed_reporta: user.id).where(state: "Abierto")
    @task1 = Accion.where( user_id: current_user.id).where(estado: "Abierta")
    @task2 = Task.where( user_id: current_user.id).where(estado: false)
    events = []
    @task.each do |task|
      if task.contador_seg > 5
        @color = "#22c488"
      elsif task.contador_seg <= 5 && task.contador_seg >= 0
          @color = "orange"
      else
          @color = "#d82c2c"
    end
      events << {:id => task.id, :title => "#{task.description} ", :start => "#{task.f_compromiso}" , :color => "#{@color}", :url =>"reports/#{task.id}"}
    end

    @task1.each do |task1|
      if task1.contador_seg > 5
        @color1 = "#22c488"
      elsif task1.contador_seg <= 5 && task1.contador_seg >= 0
          @color1 = "orange"
      else
          @color1 = "#d82c2c"
    end
      events << {:id => task1.id, :title => "#{task1.descripcion} ", :start => "#{task1.f_compromiso}" , :color => "#{@color1}", :url =>"reports/#{task1.report_id}/accions/#{task1.id}"}
    end

    @task2.each do |task2|
      if task2.contador_seg > 5
        @color2 = "#22c488"
      elsif task2.contador_seg <= 5 && task2.contador_seg >= 0
          @color2 = "orange"
      else
          @color2 = "#d82c2c"
    end
      events << {:id => task2.id, :title => "#{task2.name} ", :start => "#{task2.f_compromiso}" , :color => "#{@color2}", :url =>"reports/#{task2.report_id}/tasks"}
    end
    render :plain => events.to_json

end




def abiertos
    
   
   if params[:search] || params[:search0] || params[:search2] || params[:search3]|| params[:search4] || params[:search5] || params[:search6] || params[:search7]
     @reports1 = Report.where(state: "Abierto").search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6],params[:search7])
      puts "holaaaaaaaa"
      puts params[:search3]
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
                @reports = @reports2.paginate(page: params[:page],:per_page => 30)
                @route = reports_abiertos_path

   
    
    
    render 'index'
              else
                    @reports = @reports1.paginate(page: params[:page],:per_page => 30).where(admin_user: current_user.admin_user).order(created_at: :desc)
@route = reports_abiertos_path

   
    
    
    render 'index'
              end



  
end


def reportst_calendar

  

end






def index

    


  
       
              @es = Source.where({default: true, admin_user: current_user.admin_user}).first
              
              if params[:search] || params[:search0] || params[:search2] || params[:search3]|| params[:search4] || params[:search5] || params[:search6] || params[:search7]
                   @reports1 = Report.search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6], params[:search7])
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
                @reports = @reports2.paginate(page: params[:page],:per_page => 30)
                
              else
                    @reports = @reports1.paginate(page: params[:page],:per_page => 30).where(admin_user: current_user.admin_user).order(created_at: :desc)

              end

                  @route = reports_path  

      


  end



def cerrados
    
   if params[:search] || params[:search0] || params[:search2] || params[:search3]|| params[:search4] || params[:search5] || params[:search6] ||  params[:search7]
     @reports1 = Report.where(state: "Cerrado").search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6], params[:search7])
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
                @reports = @reports2.paginate(page: params[:page],:per_page => 30)
                
              else
                    @reports = @reports1.paginate(page: params[:page],:per_page => 30).where(admin_user: current_user.admin_user).order(created_at: :desc)

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
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @actividad = Accion.where(report_id: @report.id).where(tipo: "Actividad").count
    @accions = Accion.where(report_id: @report.id)
    @tasks = Task.where(report_id: @report.id)
    @cliente_proveedors1 = ClinteProveedor.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @menu_accion = ["","",""]
    @seguimientos = @report.rseguimientos.order(created_at: :desc)
    @seguimientosa = []
    @accions.each do |accion|
       accion.aseguimientos.each do |seg| 
        
        @seguimientosa << seg

       end 

    end
    @seguimientos_t = @seguimientos + @seguimientosa

    @accion_eficaz = @report.accions.where(eficaz: true).count
    @accion_noeficaz = @report.accions.where(eficaz: false).count
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
        :template => 'reports/pdfs/report.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
                    top: 30
                     },
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

    render :layout => "admin_report"
  end


def  report_pdf

    @responsables = @report.employeds
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").count
    @actividad = Accion.where(report_id: @report.id).where(tipo: "Actividad").count
    @accions = Accion.where(report_id: @report.id)
    @tasks = Task.where(report_id: @report.id)
    @cliente_proveedors1 = ClinteProveedor.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @menu_accion = ["","",""]
    @seguimientos = @report.rseguimientos.order(created_at: :desc)
    @seguimientosa = []
    @accions.each do |accion|
       accion.aseguimientos.each do |seg| 
        
        @seguimientosa << seg

       end 

    end
    @seguimientos_t = @seguimientos + @seguimientosa

    @accion_eficaz = @report.accions.where(eficaz: true).count
    @accion_noeficaz = @report.accions.where(eficaz: false).count
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
        :template => 'reports/pdfs/report_pdf.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
                    top: 30
                     },
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
















  def show_info
    @responsables = @report.employeds
    @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").where(estado: "Abierta").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").where(estado: "Cerrada").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").where(estado: "Abierta").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").where(estado: "Cerrada").count
    @actividad = Accion.where(report_id: @report.id).where(tipo: "Actividad").count
    @accions = Accion.where(report_id: @report.id)
    @tasks = Task.where(report_id: @report.id)
    @seguimientos = @report.rseguimientos.order(created_at: :desc)
    @accion_eficaz = @report.accions.where(eficaz: true).count
    @accion_noeficaz = @report.accions.where(eficaz: false).count
    
  end





  # GET /reports/new
  def new
    
    if params[:idr]
        puts "11111111111111111111111111111111111"
        @riesgo = Riesgo.find(params[:idr])
        @riesgo_e  = "si"
        @riesgo_id = @riesgo.id
        @descripcion = @riesgo.descripcion
        @proceso = @riesgo.proceso_id
        @fuente = SourceParent.where(admin_user: current_user.admin_user).where(codigo:"RS").first.id
        @tipo = Source.where(admin_user: current_user.admin_user).where(codigo:"GR").first.id
    else
        puts "222222222222222222222222222222222222222222"
        @riesgo_e = "no"
        @descripcion = ""
        @proceso = 0
        @fuente = 0
        @tipo = 0
         @riesgo_id = 0
    end  


    @report = Report.new
    @user = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @es = Source.where({default: true, admin_user: current_user.admin_user}).first
    @source_parents = SourceParent.where(admin_user: current_user.admin_user)
    @cliente_proveedors1 = ClinteProveedor.where(admin_user: current_user.admin_user).order(created_at: :desc)

    
  end

  # GET /reports/1/edit
  def edit

    @user = Employed.where(email: current_user.email).first
    @es = Source.where({default: true, admin_user: current_user.admin_user}).first
    @source_parents = SourceParent.where(admin_user: current_user.admin_user)
    @cliente_proveedors1 = ClinteProveedor.where(admin_user: current_user.admin_user).order(created_at: :desc)

@report.tag = false
  end

  # POST /reports
  # POST /reports.json
  def create
    
    
    @user = Employed.where(email: current_user.email).first
    @cliente_proveedors1 = ClinteProveedor.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @report = Report.new(report_params)
    @es = Source.where({default: true, admin_user: current_user.admin_user}).first
    @report.state = "Abierto"
    @report.tag = true
    num = Report.where(admin_user: current_user.admin_user).where(source_id: @report.source_id).where(source_parent_id:@report.source_parent_id).maximum(:contador)
    if num != nil
        num = num + 1

    else
        num = 1001
    end
    ano = Time.now.year.to_s
    ano = ano.remove("20") 
    
   
    respond_to do |format|
      if @report.save
        source = Source.find(@report.source_id).codigo
        source_p = SourceParent.find(@report.source_parent_id).codigo
        code = "#{source_p}-#{source}-#{num}-#{ano}" 
        @report.codigo = code
        @report.contador = num
        @report.costo = 0
         @report.costo_presupuestado = 0
        @report.balon = "responsable"
        @report.save
        employed = Employed.find(@report.employed_id)
         CreateMailer.create_report(employed,@report).deliver

           @report.employeds.each do |employed1|
        
                CreateMailer.invitado_report(employed1, @report).deliver
          
        end
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
    @cliente_proveedors1 = ClinteProveedor.where(admin_user: current_user.admin_user).order(created_at: :desc)

    respond_to do |format|
      if @report.update(report_params)
        if params[:remove_archivo]
        @report.remove_evidencia!
        @report.save
      end
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
      
      @sourcep = SourceParent.find(params[:id])
      @source =  @sourcep.sources.order(name: :asc).first
      @params = { sourcep: @sourcep, source: @source }
      render :json => @params
  end
  def get_sourceep
      
      @sourcep = Source.find(params[:id]) 
      render :json => @sourcep
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


    def set_source_parents
       
        puts params[:id]
        @sources = SourceParent.find(params[:id]).sources.order(name: :asc)
        render :json => @sources


      end   



 def change_state
 
    @report = Report.find(params[:report])
    if @report.update(justificacion_cumplio: params[:justificacion_cumplio], cumplio: true, change_cumplio: true , tag: false)
    redirect_to @report
end
 
    


 end     


      def new_hallazgo


        
      end


 def new_parte
    @clinte_proveedor = ClinteProveedor.new
  end


def crear_parte
   @clinte_proveedor = ClinteProveedor.new(user_id:params[:user_id], admin_user:params[:admin_user], name:params[:name],cliente_proveedor_type_id: params[:cliente_proveedor_type_id],pbx: params[:pbx],address: params[:address],nit: params[:nit],correo_empresa: params[:correo_empresa] ,web: params[:web])
   if @clinte_proveedor.save
   @cliente_proveedors1 = ClinteProveedor.where(admin_user: current_user.admin_user).last
   @contact = Contact.new(user_id:params[:user_id], admin_user:params[:admin_user],clinte_proveedor_id:@clinte_proveedor.id, name:params[:name_contact], mobil:params[:movil_contact], email:params[:email_contact], cargo:params[:cargo_contact])
   @contact.save
    end
      
           
     
end


      def crear_hallazgo

  
            @source  =  Source.new(name:params[:name],user_id:current_user.id, admin_user:current_user.admin_user)
            @source_parent = SourceParent.find(params[:id_source].to_i)
            if @source.save
              @source.source_parents << @source_parent
                
            end
           
            @sourcess = @source_parent.sources.order(created_at: :desc)

       
      end

      def crear_hallazgo_p

  
            @source_parent  =  SourceParent.new(name:params[:name],user_id:current_user.id, admin_user:current_user.admin_user)
            @source_parent.save
            
           
            @source_parents = SourceParent.where(admin_user: current_user.admin_user).order(created_at: :desc)

       
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
      params.require(:report).permit( :employed_id, :proceso_id, :description, :requisito, :evidencia, :nc_type, :accion, :justificacion, :user_id, :admin_user,:state,:codigo,:contador , :source_id,:archivo, :employed_reporta, :f_seguimiento, :f_compromiso,:estado_vencida,:estado_proxima,:estado_vigente ,:fp_seguimiento, :f_real,:clinte_proveedor_id,:contact_id,:contador_seg,:costo,:name, :tag,:source_parent_id ,:remove_archivo,:cierra_id,:costo_presupuestado, :riesgo_id ,:employed_ids => [], :numeral_ids => [])
    end
end



