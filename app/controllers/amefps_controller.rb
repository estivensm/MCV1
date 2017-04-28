class AmefpsController < ApplicationController
  
  def show
  
    @amefp = Amefp.find(params[:causa])
    @causas  = Amef.where(amefp_id: @amefp)
    @nprm = (Amef.where(amefp_id: @amefp).maximum(:npr) * (@amefp.npr_tage.to_f/100)).to_i
    
  end

   

  
end
