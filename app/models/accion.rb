# == Schema Information
#
# Table name: accions
#
#  id             :integer          not null, primary key
#  codigo         :string
#  employed_id    :string
#  descripcion    :text
#  tipo           :string
#  costo          :integer
#  f_seguimiento  :integer
#  f_compromiso   :date
#  f_real         :date
#  estado         :string
#  cumplio        :boolean
#  contador       :integer
#  evidencia      :text
#  contador_seg   :integer
#  user_id        :integer
#  admin_user     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  report_id      :integer
#  fp_seguimiento :date
#

class Accion < ApplicationRecord
	belongs_to :report
	has_and_belongs_to_many :employeds
    has_many :aseguimientos
    belongs_to :user
    validate :start_must_be_before_end_time
    validates :employed_id, presence: true
    after_destroy :restar_costo
    

	

    def start_must_be_before_end_time
    	self.fp_seguimiento = Time.at(Time.now.to_i + (self.f_seguimiento*60*60*24))
        @times = self.f_compromiso.to_time
        @time =  @times.to_i - Time.now.to_i  
        self.contador_seg = (@time / 60 / 60/ 24) + 1
        errors.add(:La, " frecuencia de seguimiento no puede ser mayor a la fecha de compromiso") unless
        self.contador_seg > self.f_seguimiento

  end

  def restar_costo

    report = Report.find(report_id)
    report.costo = report.costo - self.costo
    report.save
      
  end
 
end
 

 