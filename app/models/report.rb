# == Schema Information
#
# Table name: reports
#
#  id            :integer          not null, primary key
#  source        :string
#  employed_id   :integer
#  proceso_id    :integer
#  description   :text
#  requisito     :text
#  evidencia     :text
#  nc_type       :string
#  accion        :string
#  justificacion :text
#  user_id       :integer
#  admin_user    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Report < ApplicationRecord
has_and_belongs_to_many :employed
belongs_to :source
belongs_to :proceso
after_save :enviar_email


def self.search(search)
            where("source like '%#{search}%' or description like '%#{search}%' "  )  
        end

def enviar_email

self.employed.each do |employed|
	
	ReportMailer.noty_report(employed, self).deliver
    
        	end
        end        

end
