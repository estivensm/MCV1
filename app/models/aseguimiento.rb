# == Schema Information
#
# Table name: aseguimientos
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  admin_user    :integer
#  f_seguimiento :date
#  descripcion   :text
#  cierra        :boolean
#  eficaz        :boolean
#  conclucion    :text
#  costo         :integer
#  evidencia     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  accion_id     :integer
#

class Aseguimiento < ApplicationRecord
	belongs_to :accion
	belongs_to :user
	mount_uploader :evidencia, ArchivoSegUploader
	after_create :cerrar_accion

	def cerrar_accion

        if self.cierra

            accion = Accion.find(self.accion_id)
            accion.f_compromiso >= Time.now ? (accion.cumplio = true) : (accion.cumplio = false)
            accion.f_real = Time.now
            report = Report.find(accion.report_id)
            accion.update(estado: "Cerrada", costo: self.costo)
             accion.save
            report.costo = self.costo + report.costo
            report.save 
          

            
                       
            
        end

	end
  
end


   
    
  
  