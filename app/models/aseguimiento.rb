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
#  s_cierre      :boolean
#

class Aseguimiento < ApplicationRecord
	belongs_to :accion
	belongs_to :user
	mount_uploader :evidencia, ArchivoSegUploader
	after_create :cerrar_accion
    after_create :email

	def cerrar_accion
    accion = Accion.find(self.accion_id)
    accion.s_cierre = self.s_cierre
    puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    puts accion.s_cierre
    accion.save
        if self.cierra

            accion = Accion.find(self.accion_id)
            accion.f_compromiso >= Time.now ? (accion.cumplio = true) : (accion.cumplio = false)
            accion.f_real = Time.now
            report = Report.find(accion.report_id)
            
            accion.update(estado: "Cerrada", costo: self.costo, eficaz: self.eficaz)

             accion.save
            report.costo = self.costo + report.costo
            report.save 

       
            
                       
            
        end

            accion = Accion.find(self.accion_id)
        employed = Employed.where(email: self.user.email).take     
    if accion.employed_id.to_i == employed.id
        accion.fp_seguimiento = Time.at(Time.now.to_i + (accion.f_seguimiento*60*60*24))
        accion.save
    end
    

	end


    def email

    employed = Employed.find(self.accion.employed_id)
    employed_creo = Employed.where(email: self.user.email).where(admin_user: self.admin_user).first
    if employed.id != employed_creo.id    
    CreateMailer.create_seguimiento_accion(employed, self).deliver
    end
    accion = Accion.find(self.accion_id)
    accion.employeds.each do |emp|
        if emp.id != employed_creo.id
        CreateMailer.create_seguimiento_accion(emp, self).deliver
            end
    end


    end
  
end


   

  
  