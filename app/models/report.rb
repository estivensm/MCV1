# == Schema Information
#
# Table name: reports
#
#  id               :integer          not null, primary key
#  employed_id      :integer
#  proceso_id       :integer
#  description      :text
#  requisito        :text
#  evidencia        :text
#  nc_type          :string
#  accion           :string
#  justificacion    :text
#  user_id          :integer
#  admin_user       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  state            :string
#  codigo           :string
#  contador         :integer
#  source_id        :integer
#  archivo          :string
#  employed_reporta :integer
#

class Report < ApplicationRecord
has_and_belongs_to_many :employeds
has_and_belongs_to_many :numerals
belongs_to :source
belongs_to :proceso
belongs_to :user
has_many :accions
after_create :enviar_email


mount_uploader :archivo, ArchivoReportUploader
validate :archivo_size_validation, :if => "archivo?"  

  def archivo_size_validation
    errors[:archivo] << "should be less than 1MB" if archivo.size > 1.megabytes
  end



def self.search(search, search2)
          if search2 != ""
	        where("description like '%#{search.downcase}%' or description like '%#{search.upcase}%'  or description like '%#{search.capitalize}%' or state like '%#{search.downcase}%' or state like '%#{search.capitalize}%' ").where(source_id: search2)
	         else
            where("description like '%#{search.downcase}%' or description like '%#{search.upcase}%'  or description like '%#{search.capitalize}%' or state like '%#{search.downcase}%' or state like '%#{search.capitalize}%' ")
                    end
      end

def enviar_email

self.employeds.each do |employed|
	
	ReportMailer.noty_report(employed, self).deliver
    
        	end
        end

               

end
