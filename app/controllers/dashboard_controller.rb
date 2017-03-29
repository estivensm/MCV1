class DashboardController < ApplicationController
 before_action :authenticate_user!
  def index

  	@reports = Report.limit(3).order(f_compromiso: :asc)
  	@accions = Accion.limit(3).order(f_compromiso: :asc)
  end
end
