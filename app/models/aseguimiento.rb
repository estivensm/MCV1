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
#  send_mail     :boolean
#  type_tracing  :string
#

class Aseguimiento < ApplicationRecord
	belongs_to :accion
	belongs_to :user
	mount_uploader :evidencia, ArchivoSegUploader
	after_create :cerrar_accion
    after_create :email
    validates :costo, presence: true 


	def cerrar_accion
    accion = Accion.find(self.accion_id)
    self.type_tracing = "Accion"
    save
    accion.s_cierre = self.s_cierre
    puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    puts accion.s_cierre
    accion.save
        if self.cierra

            accion = Accion.find(self.accion_id)
            accion.f_compromiso >= Date.today ? (accion.cumplio = true) : (accion.cumplio = false)
            accion.f_real = Time.now
            report = Report.find(accion.report_id)
            
            accion.update(estado: "Cerrada", costo: self.costo, eficaz: self.eficaz)

            accion.save
            report.costo = self.costo + report.costo
            report.save 
            
            employed = Employed.find(report.employed_id)
            if report.accions.abiertas.count == 0

               CreateMailer.create_ultima_accion(employed, self).deliver

            end   
            
                       
            
        end

            accion = Accion.find(self.accion_id)
        employed = Employed.where(email: self.user.email).take     
    if accion.employed_id.to_i == employed.id && accion.f_seguimiento != 0

        accion.fp_seguimiento = Time.at(Time.now.to_i + (accion.f_seguimiento*60*60*24))
        accion.save
    
    end
    

	end


    def email

        if self.send_mail

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
  
end


   

  
  
