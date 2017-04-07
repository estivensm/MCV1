# == Schema Information
#
# Table name: rseguimientos
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  admin_user    :integer
#  f_seguimiento :date
#  descripcion   :text
#  report_id     :integer
#  evidencia     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  s_cierre      :boolean
#  cerrar        :boolean
#  eficaz        :boolean
#  conclucion    :text


class Rseguimiento < ApplicationRecord
	belongs_to :report
	belongs_to :user
	mount_uploader :evidencia, ArchivoRepUploader
	before_create :seguimiento
    after_create :email
    after_create :cerrar_report




    def cerrar_report
report = Report.find(self.report_id)
report.s_cierre = self.s_cierre
        if self.cerrar

          
            report.f_compromiso >= Time.now ? (report.cumplio = true) : (report.cumplio = false)
            report.f_real = Time.now
            report.conclucion = self.conclucion
            report.eficaz = self.eficaz
            report.state = "Cerrado"
            
            #report = Report.find(accion.report_id)
            
            #accion.update(estado: "Cerrada", costo: self.costo, eficaz: self.eficaz)

             #accion.save
            #report.costo = self.costo + report.costo
            #report.save 

       
            
                       
            
        #end

            #accion = Accion.find(self.accion_id)
        #employed = Employed.where(email: self.user.email).take     
    #if accion.employed_id.to_i == employed.id
       # accion.fp_seguimiento = Time.at(Time.now.to_i + (accion.f_seguimiento*60*60*24))
        #accion.save
    end
report.save

  end

	def seguimiento
        report = Report.find(self.report_id)
        employed = Employed.where(email: self.user.email).take     
    if report.employed_id == employed.id
		report.fp_seguimiento = Time.at(Time.now + (report.f_seguimiento*60*60*24))
		report.save
	end
        
           if employed.id == report.employed_id
                
                report.balon = "asignador"
                report.save
             
        elsif employed.id == report.employed_reporta
             report.balon = "responsable" 	
             report.save
          end



end



def email
    employed = Employed.find(self.report.employed_id)
    employed_creo = Employed.where(email: self.user.email).where(admin_user: self.admin_user).first
    if employed.id != employed_creo.id

    CreateMailer.create_seguimiento_report(employed, self).deliver
    
    end

    report = Report.find(self.report_id)
    report.employeds.each do |emp|
         if emp.id != employed_creo.id

        CreateMailer.create_seguimiento_report(emp, self).deliver
                end
    end


    end
end
