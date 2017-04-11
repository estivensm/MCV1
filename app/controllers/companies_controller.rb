class CompaniesController < ApplicationController
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
    @companies = Company.all
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
    @company = Company.where(user_id: current_user.admin_user).take
      @reports = Report.where(admin_user:current_user.admin_user)
    @accions = Accion.where(admin_user:current_user.admin_user)
    @tasksd = Task.where(admin_user:current_user.admin_user)
    @reports.cerrados.count != 0 ? @divr = @reports.cerrados.count : @divr = 1  
    @accions.cerradas.count != 0 ? @diva = @accions.cerradas.count : @diva = 1   
    #@accions.cerradas.where(tipo: "Correcion").count != 0 ? @divc = @accions.cerradas.where(tipo: "Accion").count : @divc = 1 
    @tasksd.cerradas.count != 0 ? @divt = @tasksd.cerradas.count : @divt = 1  
    
      
    
    @rabiertos = @reports.abiertos.count 
    @racumplio =    @reports.abiertos.where("contador_seg >= ?" ,1).count 
    @ranocumplio =    @reports.abiertos.where("contador_seg < ?" ,1).count 
    @rcerrados =    @reports.cerrados.count 
    @rcumplio =    @reports.cerrados.where("contador_seg >= ?" ,1).count 
    @rnocumplio =    @reports.cerrados.where("contador_seg < ?" ,1).count 
    @rporcentaje=    ((@reports.cerrados.where("contador_seg >= ?" ,1).count.to_f/@divr)*100).to_i 
      
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
      @aanocumplio =   @accions.abiertas.where("contador_seg < ?" ,1).count 
      @aacumplio =   @accions.abiertas.where("contador_seg >= ?" ,1).count 
      @acerradas=  @accions.cerradas.count 
      @anocumplio =   @accions.cerradas.where("contador_seg < ?" ,1).count 
      @acumplio =   @accions.cerradas.where("contador_seg >= ?" ,1).count 
      @aporcentaje = ((@accions.cerradas.where("contador_seg >= ?" ,1).count.to_f/ @diva)*100).to_i 
     
      @tasks =  @tasksd.count 
      @tabiertas =  @tasksd.abiertas.count 
      @tanocumplio =  @tasksd.abiertas.where("contador_seg < ?" ,1).count 
      @tacumplio =  @tasksd.abiertas.where("contador_seg >= ?" ,1).count 
      @tcerradas =   @tasksd.cerradas.count 
      @tnocumplio =  @tasksd.cerradas.where("contador_seg < ?" ,1).count 
      @tcumplio =  @tasksd.cerradas.where("contador_seg >= ?" ,1).count 
      @tporcentaje = ((@tasksd.cerradas.where("contador_seg >= ?" ,1).count.to_f/@divt)*100).to_i
      

     
      

      @total1 = @reports.count + @acciones + @tasks
      @total2 = @racumplio  + @aacumplio + @tacumplio
      @total3 = @ranocumplio  + @aanocumplio + @tanocumplio
      @total4 = @rabiertos + @aabiertas + @tabiertas
      @total5 = @rcumplio  + @acumplio + @tcumplio
      @total6 = @rnocumplio  + @anocumplio + @tnocumplio
      @total7 = @rcerrados + @acerradas + @tcerradas

      @total8 = @total7 == 0 ? ((@total5.to_f/@total7.to_f)*100) : ((@total5.to_f/@total7.to_f)*100).to_i 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :logo, :phone, :address, :nit)
    end
end
