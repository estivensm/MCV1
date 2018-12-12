class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :configuracion

  
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path
    end
    
  end

  # GET /companies
  # GET /companies.json
  def index

    @companies = Company.all.paginate(page: params[:page],:per_page => 30)
  end


  
  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
         if params[:remove_logo]
        @company.remove_logo!
        @company.save
      end
        format.html { redirect_to @company, notice: 'La Empresa fue editada exitosamente.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def company_indicators

  if params[:search1] 


    @company = Company.where(user_id: current_user.admin_user).take
    @reports = Report.where(admin_user:current_user.admin_user).search("","", params[:search2], "", params[:search1], "", "",params[:search7])
    

    if params[:search1]  != "" && params[:search2]  != ""  &&  params[:search7]  != "" 


    @accions = Accion.joins(:report).where(:reports => {:proceso_id  => params[:search1]} ).where(:reports => {:source_parent_id  => params[:search7]} ).where(:reports => {:source_id  => params[:search2]} )
    @tasksd = Task.joins(:report).where(:reports => {:proceso_id  => params[:search1]} ).where(:reports => {:source_parent_id  => params[:search7]} ).where(:reports => {:source_id  => params[:search2]} )
   
   
    elsif params[:search1]  != "" && params[:search2]  != ""  &&  params[:search7]  == ""  
     
    @accions = Accion.joins(:report).where(:reports => {:proceso_id  => params[:search1]} ).where(:reports => {:source_id  => params[:search2]} )
    @tasksd = Task.joins(:report).where(:reports => {:proceso_id  => params[:search1]} ).where(:reports => {:source_id  => params[:search2]} )
  
    elsif params[:search1]  != "" && params[:search2]  == ""  &&  params[:search7]  != ""   
        
    @accions = Accion.joins(:report).where(:reports => {:proceso_id  => params[:search1]} ).where(:reports => {:source_parent_id  => params[:search7]} )
    @tasksd = Task.joins(:report).where(:reports => {:proceso_id  => params[:search1]} ).where(:reports => {:source_parent_id  => params[:search7]} )
   
      
    elsif params[:search1]  == "" && params[:search2]  != ""  &&  params[:search7]  != "" 

    @accions = Accion.joins(:report).where(:reports => {:source_parent_id  => params[:search7]} ).where(:reports => {:source_id  => params[:search2]} )
    @tasksd = Task.joins(:report).where(:reports => {:source_parent_id  => params[:search7]} ).where(:reports => {:source_id  => params[:search2]} )
   

    elsif params[:search1]  == "" && params[:search2]  == ""  &&  params[:search7]  != ""   
 
    @accions = Accion.joins(:report).where(:reports => {:source_parent_id  => params[:search7]} )
    @tasksd = Task.joins(:report).where(:reports => {:source_parent_id  => params[:search7]} )
   

    elsif params[:search1]  == "" && params[:search2]  != ""  &&  params[:search7]  == ""    
   
    @accions = Accion.joins(:report).where(:reports => {:source_id  => params[:search2]} )
    @tasksd = Task.joins(:report).where(:reports => {:source_id  => params[:search2]} )
   


    else params[:search1]  != "" && params[:search2]  == ""  &&  params[:search7]  == ""      

    @accions = Accion.joins(:report).where(:reports => {:proceso_id  => params[:search1]} )
    @tasksd = Task.joins(:report).where(:reports => {:proceso_id  => params[:search1]} )
   

    end




   
    @reports.abiertos.count != 0 ? @divra = @reports.abiertos.count : @divra = 1
    @accions.abiertas.count != 0 ? @divaa = @accions.abiertas.count : @divaa = 1
    #@accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1
    @tasksd.abiertas.count != 0 ? @divta = @tasksd.abiertas.count : @divta = 1




    @reports.cerrados.count != 0 ? @divr = @reports.cerrados.count : @divr = 1  
    @accions.cerradas.count != 0 ? @diva = @accions.cerradas.count : @diva = 1   
    #@accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1 
    @tasksd.cerradas.count != 0 ? @divt = @tasksd.cerradas.count : @divt = 1  
    
      
    
    @rabiertos = @reports.abiertos.count 
    @racumplio =    @reports.abiertos.where("contador_seg >= ?" ,0).count 
    @ranocumplio =    @reports.abiertos.where("contador_seg < ?" ,0).count 
    @rporcentaje_abi_cump =    ((@reports.abiertos.where("contador_seg >= ?" ,0).count.to_f/@divra)*100).to_i
    @rporcentaje_abi_no =    ((@reports.abiertos.where("contador_seg < ?" ,0).count.to_f/@divra)*100).to_i



    @rcerrados =    @reports.cerrados.count 
    @rcumplio =    @reports.cerrados.where(cumplio: true).count 
    @rnocumplio =    @reports.cerrados.where(cumplio: false).count 
    @rporcentaje=    ((@reports.cerrados.where(cumplio: true).count.to_f/@divr)*100).to_i
    @rporcentaje_no=    ((@reports.cerrados.where(cumplio: false).count.to_f/@divr)*100).to_i 
      
    #@correcciones =      @accions.where(tipo: "Correcion").count 
    #@canocumplio =     @accions.abiertas.where(tipo: "Correcion").where("contador_seg < ?" ,1).count 
    #@cacumplio =    @accions.abiertas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count 
    #@cabiertas =      @accions.abiertas.where(tipo: "Correcion").count 
    #@ccerradas =     @accions.cerradas.where(tipo: "Correcion").count 
    #@cnocumplio =     @accions.cerradas.where(tipo: "Correcion").where("contador_seg < ?" ,1).count 
    #@ccumplio =    @accions.cerradas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count 
     #@cporcentaje =  ((@accions.cerradas.where(tipo: "Correcion").where("contador_seg >= ?" ,1).count.to_f/ @divc)*100).to_i 

     

####################
      @acciones =   @accions.count
      @aabiertas=   @accions.abiertas.count
      @aanocumplio =   @accions.abiertas.where("accions.contador_seg < ?" ,0).count
      @aacumplio =   @accions.abiertas.where("accions.contador_seg >= ?" ,0).count
      @aporcentaje_abi_no = ((@accions.abiertas.where("accions.contador_seg < ?" ,0).count.to_f/ @divaa)*100).to_i
      @aporcentaje_abi_cump = (( @accions.abiertas.where("accions.contador_seg >= ?" ,0).count.to_f/ @divaa)*100).to_i




      @acerradas=  @accions.cerradas.count
      @anocumplio =   @accions.cerradas.where(cumplio: false).count
      @acumplio =   @accions.cerradas.where(cumplio: true).count
      @aporcentaje = ((@accions.cerradas.where(cumplio: true).count.to_f/ @diva)*100).to_i
      @aporcentaje_no = ((@accions.cerradas.where(cumplio: false).count.to_f/ @diva)*100).to_i


      @tasks =  @tasksd.count
      @tabiertas =  @tasksd.abiertas.count
      @tacumplio =  @tasksd.abiertas.where("tasks.contador_seg >= ?" ,0).count
      @tanocumplio =  @tasksd.abiertas.where("tasks.contador_seg < ?" ,0).count
      @tporcentaje_abi_cump = ((@tasksd.abiertas.where("tasks.contador_seg >= ?" ,0).where(cumplio: true).count.to_f/@divta)*100).to_i
      @tporcentaje_abi_no = ((@tasksd.abiertas.where("tasks.contador_seg < ?" ,0).count.to_f/@divta)*100).to_i
      puts @divta
      
      puts "porcentajjeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"


      @tcerradas =   @tasksd.cerradas.count
      @tnocumplio =  @tasksd.cerradas.where(cumplio: false).count
      @tcumplio =  @tasksd.cerradas.where(cumplio: true).count
      @tporcentaje = ((@tasksd.cerradas.where(cumplio: true).count.to_f/@divt)*100).to_i
      @tporcentaje_no = ((@tasksd.cerradas.where(cumplio: false).count.to_f/@divt)*100).to_i





      @total1 = @reports.count + @acciones + @tasks
      @total2 = @racumplio  + @aacumplio + @tacumplio
      @total3 = @ranocumplio  + @aanocumplio + @tanocumplio
      @total4 = @rabiertos + @aabiertas + @tabiertas
      @total5 = @rcumplio  + @acumplio + @tcumplio
      @total6 = @rnocumplio  + @anocumplio + @tnocumplio
      @total7 = @rcerrados + @acerradas + @tcerradas

      @total8 = @total7 == 0 ? ((@total5.to_f/@total7.to_f)*100) : ((@total5.to_f/@total7.to_f)*100).to_i


      
      @total_abiertas_v = @total_abiertas != 0 ? @total_abiertas : 1

      @total_abiertas_cumplio = @racumplio  +  @aacumplio  + @tacumplio
      @total_abiertas_no_cumplio = @ranocumplio + @aanocumplio + @tanocumplio
      @total_abiertas = @total_abiertas_cumplio + @total_abiertas_no_cumplio
      @por_tac = @total_abiertas == 0 ? 0 : ((@total_abiertas_cumplio.to_f/@total_abiertas)*100).to_i
      @por_tanc = @total_abiertas == 0 ? 0 :  ((@total_abiertas_no_cumplio.to_f/@total_abiertas)*100).to_i




























      else 

      @company = Company.where(user_id: current_user.admin_user).take
    @reports = Report.where(admin_user:current_user.admin_user)
    @accions = Accion.where(admin_user:current_user.admin_user)
    @tasksd = Task.where(admin_user:current_user.admin_user)
       @reports.abiertos.count != 0 ? @divra = @reports.abiertos.count : @divra = 1
    @accions.abiertas.count != 0 ? @divaa = @accions.abiertas.count : @divaa = 1
    #@accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1
    @tasksd.abiertas.count != 0 ? @divta = @tasksd.abiertas.count : @divta = 1




    @reports.cerrados.count != 0 ? @divr = @reports.cerrados.count : @divr = 1  
    @accions.cerradas.count != 0 ? @diva = @accions.cerradas.count : @diva = 1   
    #@accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1 
    @tasksd.cerradas.count != 0 ? @divt = @tasksd.cerradas.count : @divt = 1  
    
      
    
    @rabiertos = @reports.abiertos.count 
    @racumplio =    @reports.abiertos.where("contador_seg >= ?" ,1).count 
    @ranocumplio =    @reports.abiertos.where("contador_seg < ?" ,1).count 
    @rporcentaje_abi_cump =    ((@reports.abiertos.where("contador_seg >= ?" ,1).count.to_f/@divra)*100).to_i
    @rporcentaje_abi_no =    ((@reports.abiertos.where("contador_seg < ?" ,1).count.to_f/@divra)*100).to_i



    @rcerrados =    @reports.cerrados.count 
    @rcumplio =    @reports.cerrados.where(cumplio: true).count 
    @rnocumplio =    @reports.cerrados.where(cumplio: false).count 
    @rporcentaje=    ((@reports.cerrados.where(cumplio: true).count.to_f/@divr)*100).to_i
    @rporcentaje_no=    ((@reports.cerrados.where(cumplio: false).count.to_f/@divr)*100).to_i 
      
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
      @aanocumplio =   @accions.abiertas.where("contador_seg < ?" ,0).count
      @aacumplio =   @accions.abiertas.where("contador_seg >= ?" ,0).count
      @aporcentaje_abi_no = ((@accions.abiertas.where("contador_seg < ?" ,0).count.to_f/ @divaa)*100).to_i
      @aporcentaje_abi_cump = (( @accions.abiertas.where("contador_seg >= ?" ,0).count.to_f/ @divaa)*100).to_i




      @acerradas=  @accions.cerradas.count
      @anocumplio =   @accions.cerradas.where(cumplio: false).count
      @acumplio =   @accions.cerradas.where(cumplio: true).count
      @aporcentaje = ((@accions.cerradas.where(cumplio: true).count.to_f/ @diva)*100).to_i
      @aporcentaje_no = ((@accions.cerradas.where(cumplio: false).count.to_f/ @diva)*100).to_i


      @tasks =  @tasksd.count
      @tabiertas =  @tasksd.abiertas.count
      @tacumplio =  @tasksd.abiertas.viegentes_t.count
      @tanocumplio =  @tasksd.abiertas.vencidas.count
      @tporcentaje_abi_cump = ((@tasksd.abiertas.viegentes_t.where(cumplio: true).count.to_f/@divta)*100).to_i
      @tporcentaje_abi_no = ((@tasksd.abiertas.vencidas.count.to_f/@divta)*100).to_i
      puts @divta
      
      puts "porcentajjeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"


      @tcerradas =   @tasksd.cerradas.count
      @tnocumplio =  @tasksd.cerradas.where(cumplio: false).count
      @tcumplio =  @tasksd.cerradas.where(cumplio: true).count
      @tporcentaje = ((@tasksd.cerradas.where(cumplio: true).count.to_f/@divt)*100).to_i
      @tporcentaje_no = ((@tasksd.cerradas.where(cumplio: false).count.to_f/@divt)*100).to_i





      @total1 = @reports.count + @acciones + @tasks
      @total2 = @racumplio  + @aacumplio + @tacumplio
      @total3 = @ranocumplio  + @aanocumplio + @tanocumplio
      @total4 = @rabiertos + @aabiertas + @tabiertas
      @total5 = @rcumplio  + @acumplio + @tcumplio
      @total6 = @rnocumplio  + @anocumplio + @tnocumplio
      @total7 = @rcerrados + @acerradas + @tcerradas

      @total8 = @total7 == 0 ? ((@total5.to_f/@total7.to_f)*100) : ((@total5.to_f/@total7.to_f)*100).to_i


      
      @total_abiertas_v = @total_abiertas != 0 ? @total_abiertas : 1

      @total_abiertas_cumplio = @racumplio  +  @aacumplio  + @tacumplio
      @total_abiertas_no_cumplio = @ranocumplio + @aanocumplio + @tanocumplio
      @total_abiertas = @total_abiertas_cumplio + @total_abiertas_no_cumplio
      @por_tac = @total_abiertas == 0 ? 0 : ((@total_abiertas_cumplio.to_f/@total_abiertas)*100).to_i
      @por_tanc = @total_abiertas == 0 ? 0 :  ((@total_abiertas_no_cumplio.to_f/@total_abiertas)*100).to_i





    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :logo, :phone, :address, :nit, :admin_user,:remove_logo)
    end
end
