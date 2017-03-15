class MyReportsController < ApplicationController

  def index
  	@employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first
    @report_search1 = Report.where(employed_id: @employed)
    if params[:search]
    	
    	@reports = @report_search1.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6])

    else 
    	@reports = @report_search1

    end

    @resp = "resp"

  end

  def asignado_por_mi
     
  
            
    
    @report_search1 = Report.where(user_id: current_user.id).where(admin_user: current_user.admin_user)
    if params[:search]
      
      @reports = @report_search1.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6])

    else 
      @reports = @report_search1

    end

    
@resp = "asig"

    render "index"
  end



def invitado
     
  @employed = Employed.where(email: current_user.email).where(admin_user: current_user.admin_user).first

    
     
    
            
    
    @report_search1 = @employed.reports
    if params[:search]
      
      @reports = @report_search1.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6])

    else 
      @reports = @report_search1

    end
    
@resp = "n/a"
    render "index"
  end




end

