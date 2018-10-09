class EmployedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employed, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  before_action :configuracion

  
  
  def import
  Employed.import(params[:file], current_user.admin_user, current_user.admin_user )
  redirect_to employeds_path, notice: "Empleados Importados"
end




  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion && action_name != "edit_myself" && action_name != "update" && action_name != "show"
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


   @admin_employed = Employed.where(admin_user: current_user.admin_user).first.id
   @employeds = @employeds1.paginate(page: params[:page],:per_page => 30)
   

  end

  # GET /employeds/1
  # GET /employeds/1.json
  def show
    @reports = Report.where(employed_id: @employed.id)
    @accions = Accion.where(employed_id: @employed.id)
    @tasksd = @employed.tasks

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
      @aanocumplio =   @accions.abiertas.where("contador_seg < ?" ,1).count
      @aacumplio =   @accions.abiertas.where("contador_seg >= ?" ,1).count
      @aporcentaje_abi_cump = ((@accions.abiertas.where("contador_seg < ?" ,1).count.to_f/ @divaa)*100).to_i
      @aporcentaje_abi_no = (( @accions.abiertas.where("contador_seg >= ?" ,1).count.to_f/ @divaa)*100).to_i




      @acerradas=  @accions.cerradas.count
      @anocumplio =   @accions.cerradas.where(cumplio: false).count
      @acumplio =   @accions.cerradas.where(cumplio: true).count
      @aporcentaje = ((@accions.cerradas.where(cumplio: true).count.to_f/ @diva)*100).to_i
      @aporcentaje_no = ((@accions.cerradas.where(cumplio: false).count.to_f/ @diva)*100).to_i


      @tasks =  @employed.tasks.count
      @tabiertas =  @employed.tasks.abiertas.count
      @tanocumplio =  @employed.tasks.abiertas.where(cumplio: false).count
      @tacumplio =  @employed.tasks.abiertas.where(cumplio: true).count
      @tporcentaje_abi_cump = ((@employed.tasks.abiertas.where(cumplio: true).count.to_f/@divta)*100).to_i
      @tporcentaje_abi_no = ((@employed.tasks.abiertas.where(cumplio: false).count.to_f/@divta)*100).to_i



      @tcerradas =   @employed.tasks.cerradas.count
      @tnocumplio =  @employed.tasks.cerradas.where(cumplio: false).count
      @tcumplio =  @employed.tasks.cerradas.where(cumplio: true).count
      @tporcentaje = ((@employed.tasks.cerradas.where(cumplio: true).count.to_f/@divt)*100).to_i
      @tporcentaje_no = ((@employed.tasks.cerradas.where(cumplio: false).count.to_f/@divt)*100).to_i





      @total1 = @reports.count + @acciones + @tasks
      @total2 = @racumplio  + @aacumplio + @tacumplio
      @total3 = @ranocumplio  + @aanocumplio + @tanocumplio
      @total4 = @rabiertos + @aabiertas + @tabiertas
      @total5 = @rcumplio  + @acumplio + @tcumplio
      @total6 = @rnocumplio  + @anocumplio + @tnocumplio
      @total7 = @rcerrados + @acerradas + @tcerradas

      @total8 = @total7 == 0 ? ((@total5.to_f/@total7.to_f)*100) : ((@total5.to_f/@total7.to_f)*100).to_i




   
  end

  # GET /employeds/new
  def new
    @employed = Employed.new
    @rol =  Rol.where(name: "Basico").where(admin_user: current_user.admin_user).where(default: true).first.id
  end

  # GET /employeds/1/edit
  def edit
    @user_name = User.where(email: @employed.email).where(admin_user: current_user.admin_user).first.name
  end

  def edit_myself

     @employed = Employed.find(params[:id])
     @user_name = User.where(email: @employed.email).where(admin_user: current_user.admin_user).first.name

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
       if params[:remove_avatare]
        @employed.remove_avatare!
        @employed.save
      end
        redirect_to employed_path(@employed.id)
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
      params.require(:employed).permit(:first_name, :second_name, :first_last_name, :second_last_name, :document_type, :document, :birth_date, :genero, :admin_user, :user_id, :avatare, :cargo_id, :email,:remove_avatare,:password, :password_c,:is_user,:user_name,:rol_id)
    end
end
