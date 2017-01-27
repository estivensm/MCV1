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
	mount_uploader :evidencia, ArchivoSegUploader
	after_create :cerrar_accion

	def cerrar_accion

        if self.cierra

            Accion.find(self.accion_id).update(estado: "Cerrada")
            save
            
        end

	end
  
end
