# == Schema Information
#
# Table name: riesgos
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  admin_user             :integer
#  report_id              :integer
#  accion_id              :integer
#  descripcion            :text
#  clasificacion          :string
#  nivel                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  context                :string
#  treatment              :string
#  classification_risk_id :integer
#  justification          :text
#  state                  :boolean
#  risk_state             :boolean
#  risk_value             :integer
#  proceso_id             :integer
#  risk_level             :string
#  risk_source_id         :integer
#

class Riesgo < ApplicationRecord
	belongs_to :proceso
    belongs_to :classification_risk
    belongs_to :risk_source
	has_many :valoration_risks , dependent: :destroy
    has_one :report


    def self.search(search, search2, search3)
    	search != "" ? (scope :clasificacion, -> { where(classification_risk_id: search) }) : (scope :clasificacion, -> { where.not(id: nil) }) 
        search2 != "" ? (scope :fuente, -> { where(risk_source_id: search2) }) : (scope :fuente, -> { where.not(id: nil) })
        search3 != "" ? (scope :descrip, -> { where(descripcion: search3) }) : (scope :descrip, -> { where.not(id: nil) })

        clasificacion.fuente.descrip
    end
end


