class MyReportsController < ApplicationController
  def index
  	@employed = Employed.where(email: current_user.email).first
  	@reports = []
    
    @report_search = Report.where(admin_user: current_user.admin_user)
    if params[:search]
    	
    	@report = @report_search.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6])

    else 
    	@report = @report_search

    end



  	@report.each do |report|

  		@reports.push report.id if report.employeds.exists?(id: @employed.id)
        
                     
		
            
  	end 

    @report_search1 = Report.where(employed_id: @employed)
    if params[:search]
    	
    	@report1 = @report_search1.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6])

    else 
    	@report1 = @report_search1

    end



  	@report1.each do |report1|
        
        @reports.push report1
  	end



  end

  def asignado_por_mi
     
    @reports = []
    
     
    
            
    
    @report_search1 = Report.where(user_id: current_user.id)
    if params[:search]
      
      @report1 = @report_search1.search(params[:search0],params[:search],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6])

    else 
      @report1 = @report_search1

    end



    @report1.each do |report1|
        
        @reports.push report1
    end
    render "index"
  end
end

