class AmefpsController < ApplicationController
  def show
  
    @amefp = Amefp.find(params[:causa])
    @causas  = Amef.where(amefp_id: @amefp)
    @nprm = (Amef.where(amefp_id: @amefp).maximum(:npr) * 0.2).to_i
  end

   

  
end
