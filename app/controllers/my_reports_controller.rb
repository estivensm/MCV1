class MyReportsController < ApplicationController
before_action :authenticate_user!
  def index
  	@employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @report_search1 = Report.where(employed_id: @employed).abiertos
    if params[:search]

    	@reports = @report_search1.paginate(page: params[:page],:per_page => 30).search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4] ,params[:search5],params[:search6], params[:search7]).order(f_compromiso: :asc)

    else 
    	@reports = @report_search1.paginate(page: params[:page],:per_page => 30).order(f_compromiso: :asc)

    end

    @resp = "Mis Reportes Abiertos"
    @route = misreports_path

  end

 def mis_reports_cerrados
    @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @report_search1 = Report.where(employed_id: @employed).cerrados
    if params[:search]

      @reports = @report_search1.paginate(page: params[:page],:per_page => 30).search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4] ,params[:search5],params[:search6], params[:search7]).order(f_compromiso: :asc)

    else 
      @reports = @report_search1.paginate(page: params[:page],:per_page => 30).order(f_compromiso: :asc)

    end

    @resp = "Mis Reportes Cerrados"
    @route = mis_reports_cerrados_path
 render "index"
  end











  def asignado_por_mi
     
  
            
    
    @report_search1 = Report.where(user_id: current_user.id).where(admin_user: current_user.admin_user).abiertos
    if params[:search]
      
      @reports = @report_search1.paginate(page: params[:page],:per_page => 30).search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4] ,params[:search5],params[:search6], params[:search7]).order(f_compromiso: :asc)

    else 
      @reports = @report_search1.paginate(page: params[:page],:per_page => 30).order(f_compromiso: :asc)

    end

    
@resp = "Reprtes asignados Abiertos"
@route = reports_asignados_path
    render "index"
  end



def asignados_cerrados

@report_search1 = Report.where(user_id: current_user.id).where(admin_user: current_user.admin_user).abiertos
    if params[:search]
      
      @reports = @report_search1.paginate(page: params[:page],:per_page => 30).search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4] ,params[:search5],params[:search6], params[:search7]).order(f_compromiso: :asc)

    else 
      @reports = @report_search1.paginate(page: params[:page],:per_page => 30).order(f_compromiso: :asc)

    end

    
@resp = "Reportes asignados Cerrados"
@route = asignados_cerrados_path
    render "index"


end










def invitado
     
  @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first

    
     
    
            
    
    @report_search1 = @employed.reports.abiertos
    if params[:search]
      
      @reports = @report_search1.paginate(page: params[:page],:per_page => 30).search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4] ,params[:search5],params[:search6], params[:search7]).order(created_at: :desc)

    else 
      @reports = @report_search1.paginate(page: params[:page],:per_page => 30).order(created_at: :desc)

    end
    
@resp = "Reportes Invitado"
@route = invitado_path

    render "index"
  end




end

