class CausaEfectosController < ApplicationController
  def create
        @causa = CausaEfecto.create(user_id:params[:user_id],admin_user:params[:admin_user],causa:params[:causa],nivel:params[:nivel],tipo:params[:tipo])
  if @causa.save
    
    redirect_to :back
  end
        

  end

  def udpate
  end

  def destroy
  end
end
