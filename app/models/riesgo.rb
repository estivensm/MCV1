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
#

class Riesgo < ApplicationRecord
	belongs_to :proceso
    belongs_to :classification_risk
	has_many :valoration_risks , dependent: :destroy
    has_one :report
end


