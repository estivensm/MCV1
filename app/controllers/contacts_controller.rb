class ContactsController < ApplicationController
	 before_action :set_causa, only: [:show, :edit, :update, :destroy]

  def destroy
    
    @contact.destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_causa
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def causa_params
      params.require(:contact).permit()
    end
end
