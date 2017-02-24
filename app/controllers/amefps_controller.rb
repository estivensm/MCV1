class AmefpsController < ApplicationController
  def show
  
    @amefp = Amefp.find(params[:causa])
    @causas = Amef.where(amefp_id: @amefp)
  end

   

  
end
