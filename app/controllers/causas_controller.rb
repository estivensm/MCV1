class CausasController < ApplicationController
  before_action :set_causa, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /causas
  # GET /causas.json
  def index
    @causas = Causa.all
     @report = Report.find(params[:report_id])
  end

  # GET /causas/1
  # GET /causas/1.json
  def show
     @report = Report.find(params[:report_id])
     @causa_pareto = CausaEfecto.where(causa_id: @causa.id).where(tipo: "Pareto").where("porcentaje <= ?", 80)
     @causa_paretot = CausaEfecto.where(causa_id: @causa.id).where(tipo: "Pareto").where("porcentaje > ?" , 80)
     @causa_paret = CausaEfecto.where(causa_id: @causa.id).order(porcentaje: :desc)
  @accionsca = Accion.where(report_id: @report.id).where(tipo: "Accion").where(estado: "Abierta").count
    @accionscc = Accion.where(report_id: @report.id).where(tipo: "Accion").where(estado: "Cerrada").count
    @correa = Accion.where(report_id: @report.id).where(tipo: "Correccion").where(estado: "Abierta").count
    @correc = Accion.where(report_id: @report.id).where(tipo: "Correccion").where(estado: "Cerrada").count
    @actividad = Accion.where(report_id: @report.id).where(tipo: "Actividad").count
    @accions = Accion.where(report_id: @report.id)
        @tasks = Task.where(report_id: @report.id)

  end

  # GET /causas/new
  def new
    @causa = Causa.new
    @report = Report.find(params[:report_id])
  end

  # GET /causas/1/edit
  def edit
     @report = Report.find(params[:report_id])
  end

  # POST /causas
  # POST /causas.json
  def create
    
     @report = Report.find(params[:report_id])
    @causa = Causa.new(causa_params)
    if @causa.save
        redirect_to report_causa_path(@report,@causa)
    end
  end

  # PATCH/PUT /causas/1
  # PATCH/PUT /causas/1.json
  def update
     @report = Report.find(params[:report_id])
    if @causa.update(causa_params)
        redirect_to report_causa_path(@report,@causa)
         end
  end


  # DELETE /causas/1
  # DELETE /causas/1.json
  def destroy
     @report = Report.find(params[:report_id])
    @causa.destroy
    respond_to do |format|
      format.html { redirect_to report_path(@report), notice: 'Causa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def edit_caef

      @caef = CausaEfecto.find(params[:id])
      
  end
  def new_caef
      @causa = Causa.find(params[:causa])
       @report = Report.find(@causa.report_id)
       @m = params[:m]
        @sub = params[:sub]
     
      
  end

   def update_caef

  @causa = CausaEfecto.find(params[:id])
  if @causa.update(descripcion:params[:descripcion],name:params[:name])
    
    redirect_to :back
  end
      
  end

   def create_caef
        @causa = CausaEfecto.create(estado: "vital" , subnivel:params[:subnivel], user_id:params[:user_id],admin_user:params[:admin_user],descripcion:params[:descripcion],nivel:params[:nivel],tipo:params[:tipo],causa_id:params[:causa_id],report_id:params[:report_id],name:params[:name])
  if @causa.save
    
    redirect_to :back
  end
end

  def destroy_caef
@causa = CausaEfecto.find(params[:id])

  if @causa.destroy
    
    redirect_to :back
  end
end

def show_caef

@caef = CausaEfecto.find(params[:id])
@causa = Causa.find(@caef.causa_id)

  
end

def crear_amef

redirect_to amef_path

  
end

def delete_arbol
 
  
  CausaEfecto.where(report_id: params[:report_id]).destroy_all
   #redirect_to report_causa_path(params[:report_id],params[:causa_id])
end

def crear_arbol


  

  if CausaEfecto.where(report_id: params[:report_id]).where(nivel:params[:node]).count == 0  
   
  #puts "fasddddddddddddddddddddddddddddddddddddddddddddddd"
  #puts CausaEfecto.where(report_id: params[:report_id]).where(nivel:params[:nivel]).count
  CausaEfecto.create(user_id:current_user.id, admin_user:current_user.admin_user, report_id: params[:report_id],causa_id: params[:causa_id],name: params[:name],nivel:params[:node],subnivel: params[:parent] )
  end
end

#LLama el popup para crear el AMEF padre
 def new_amefp
    @causa = Causa.find(params[:causa])
  end

#Crea el AMEF padre
  def crear_amefp
    @amefp = Amefp.create(user_id:params[:user_id],admin_user:params[:admin_user],report_id:params[:report_id],causa_id:params[:causa_id],descripcion:params[:descripcion],frp_valoracion:params[:frp_valoracion],dp_valoracion:params[:dp_valoracion],p_valor:params[:p_valor],npr_tage:params[:npr_tage])
    @amefp.p_valoracion = true
    @amefp.s_valoracion = false
    @amefp.t_valoracion = false
    @amefp.s_valor = 0
    @amefp.t_valor = 0
    if @amefp.save 
    redirect_to show_amefp_path(@amefp)
  end
end


  def update_amefp
   @amefp = Amefp.find(params[:id])  
   params[:s_valoracion] == "1" ? sval = true : sval = false
   params[:t_valoracion] == "1" ? tval = true : tval = false
    if @amefp.update(descripcion:params[:descripcion],frp_valoracion:params[:frp_valoracion],dp_valoracion:params[:dp_valoracion],p_valor:params[:p_valor],p_valoracion:params[:p_valoracion],frs_valoracion:params[:frs_valoracion],ds_valoracion:params[:ds_valoracion],s_valor:params[:s_valor],s_valoracion: sval,frt_valoracion:params[:frt_valoracion],dt_valoracion:params[:dt_valoracion],t_valor:params[:t_valor],t_valoracion:tval,npr_tage:params[:npr_tage])
    redirect_to show_amefp_path(@amefp)
  end
end

def edit_amefp
    @amefp = Amefp.find(params[:id])  
    @causa = Causa.find(@amefp.causa_id)
  end





#Actualiza los valores del AMEF
def update_vcaef

[1,2].each do 
    amefp = Amefp.find(params[:amefp])
    nprmayor = (Amef.where(amefp_id: amefp).maximum(:npr) * (amefp.npr_tage.to_f/100)).to_i

    a = params[:ids]# Array de los ids
    b = params[:p_ocurrencia] #propbabilidad de ocurrencia primera valoracion
    c = params[:pn_deteccion] #propbabilidad de no deteccion primera valoracion
    e = params[:a_tomar]
    bs = params[:sp_ocurrencia]#propbabilidad de ocurrencia segunda valoracion
    cs = params[:spn_deteccion]#propbabilidad de no deteccion segunda valoracion
    bt = params[:tp_ocurrencia]#propbabilidad de ocurrencia tercera valoracion
    ct = params[:tpn_deteccion]#propbabilidad de no deteccion tercera valoracion
    ca = params[:c_actuales]
    ok = params[:accion_ok]
    Amef.where(amefp_id: amefp.id).update_all(accion_ok:false)
    if ok != nil
    ok.each do |ame|
       amef = Amef.find(ame)
       amef.accion_ok = true
       amef.save
    end
  end
    x = 0
    a.each do |i|
      g = b[x].to_i * c[x].to_i * params[:grado].to_i
     
      
      if amefp.p_valoracion && amefp.s_valoracion && amefp.t_valoracion
         gs = bs[x].to_i * cs[x].to_i * params[:sgrado].to_i
      gt = bt[x].to_i * ct[x].to_i * params[:tgrado].to_i
      am = Amef.find(i)
      estado = ""
      gs > nprmayor ?  estado = "vital" : estado = "trivial"

      Amef.find(i).update(testado: estado , grado:params[:grado],sgrado:params[:sgrado],tgrado:params[:tgrado],p_ocurrencia: b[x],pn_deteccion: c[x] , npr: g, a_tomar: e[x],c_actuales: ca[x], sp_ocurrencia: bs[x],spn_deteccion: cs[x] , snpr: gs,tp_ocurrencia: bt[x],tpn_deteccion: ct[x] , tnpr: gt)
      
          
          #Mira si es vital o trivial de acurdo al npr tage que se puso
     CausaEfecto.find(am.causa_efecto).update(estado: estado) 
            


       elsif amefp.p_valoracion && amefp.s_valoracion && !amefp.t_valoracion
                      gs = bs[x].to_i * cs[x].to_i * params[:sgrado].to_i
                      am = Amef.find(i)
                      estado = ""
                      gs > nprmayor ?  estado = "vital" : estado = "trivial"
                      Amef.find(i).update(sestado: estado,grado:params[:grado],sgrado:params[:sgrado],p_ocurrencia: b[x],pn_deteccion: c[x] , npr: g, a_tomar: e[x],c_actuales: ca[x],sp_ocurrencia: bs[x],spn_deteccion: cs[x] , snpr: gs)
                      CausaEfecto.find(am.causa_efecto).update(estado: estado)  
                      



           elsif amefp.p_valoracion && !amefp.s_valoracion && !amefp.t_valoracion
                      am = Amef.find(i)
                   
                      estado = ""
                      am.npr > nprmayor ?  estado = "vital" : estado = "trivial"
                      puts am.npr
                      puts nprmayor
                      puts "hola"
                      Amef.find(i).update(estado: estado ,grado:params[:grado],p_ocurrencia: b[x],pn_deteccion: c[x] , npr: g, a_tomar: e[x],c_actuales: ca[x])
                       
                        CausaEfecto.find(am.causa_efecto_id).update(estado: estado) 
           end    
      x = x + 1
    end

  end
  redirect_to show_amefp_path(params[:amefp])



end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_causa
      @causa = Causa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def causa_params
      params.require(:causa).permit(:tipo, :descripcion, :archivo, :admin_user, :user_id, :report_id,:primera_m, :seguna_m,:tercera_m,:cuarta_m,:quinta_m, :sexta_m, causa_efectos_attributes: [:id,:estado, :name, :user_id,:nivel,:descripcion,:tipo,:report_id,:causa_id,:admin_user,:frecuencia, :porcentaje, :_destroy])
    end
end
