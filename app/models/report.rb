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
belongs_to :user
has_many :numeral_reports, inverse_of: :report, dependent: :destroy
accepts_nested_attributes_for :numeral_reports
after_create :enviar_email
mount_uploader :archivo, ArchivoReportUploader


def self.search(search)
	        alejo = Source.where("name like '%#{search}%' "  )
	        alejo1 = alejo.first if alejo.exists?
            where(source_id: alejo1).where("description like '%#{search}%' "  ) 
        end

def enviar_email

self.employed.each do |employed|
	
	ReportMailer.noty_report(employed, self).deliver
    
        	end
        end        

end
