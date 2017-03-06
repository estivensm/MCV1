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
#

class Rseguimiento < ApplicationRecord
	belongs_to :report
	belongs_to :user
	mount_uploader :evidencia, ArchivoRepUploader
	before_create :seguimiento
    after_create :email

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



    end
end
