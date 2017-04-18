class MyReportsController < ApplicationController

  def index
  	@employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @report_search1 = Report.where(employed_id: @employed)
    if params[:search]

    	@reports = @report_search1.search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4] ,params[:search5]).order(created_at: :desc)

    else 
    	@reports = @report_search1.order(created_at: :desc)

    end

    @resp = "resp"
    @route = misreports_path

  end

  def asignado_por_mi
     
  
            
    
    @report_search1 = Report.where(user_id: current_user.id).where(admin_user: current_user.admin_user)
    if params[:search]
      
      @reports = @report_search1.search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4] ,params[:search5]).order(created_at: :desc)

    else 
      @reports = @report_search1.order(created_at: :desc)

    end

    
@resp = "asig"
@route = reports_asignados_path
    render "index"
  end



def invitado
     
  @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first

    
     
    
            
    
    @report_search1 = @employed.reports
    if params[:search]
      
      @reports = @report_search1.search(params[:search],params[:search0],params[:search2],params[:search3],params[:search4] ,params[:search5]).order(created_at: :desc)

    else 
      @reports = @report_search1.order(created_at: :desc)

    end
    
@resp = "n/a"
@route = invitado_path

    render "index"
  end




end

