class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index

    


 if current_user.rol ==  "SuperAdmin" || current_user.rol ==  "Admin"
   
   if params[:search]

    if !params[:params].blank?
    @reports1 = Report.where(state: params[:params]).search(params[:search])
  else
    @reports1 = Report.search(params[:search])
end

      
    
  
  else
  
     if !params[:params].blank?
    @reports1 = Report.where(state: params[:params])
  else
    @reports1 = Report.all
  end
  
  end



   @reports = @reports1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user)
   


    else
      redirect_to root_path
  end





  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    @procesos = Proceso.all
    @employed = Employed.all
    @source = Source.all
    @numerals = Numeral.all
  end

  # GET /reports/1/edit
  def edit

    @procesos = Proceso.all
    @employed = Employed.all
    @source = Source.all
    @numerals = Numeral.all
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
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
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
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
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
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
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_normas
      
      @numerals = Norma.find(params[:id]).numerals 
      render :json => @numerals
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit( :employed_id, :proceso_id, :description, :requisito, :evidencia, :nc_type, :accion, :justificacion, :user_id, :admin_user,:state,:codigo,:contador , :source_id, :employed_ids => [], numeral_reports_attributes: [:id, :comment, :report_id, :numeral_id, :_destroy])
    end
end
