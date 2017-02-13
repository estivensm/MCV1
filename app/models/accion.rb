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
    

def self.search(search0,search, search2, search3, search5, search6)

   search6 = search6.chomp("s") if search6 != ""
   search2 = search2.chomp("es") if search2 != ""


    
      
    search0 != "" ? (scope :fdesdep, -> { where(['created_at > ?', search0]) }) : (scope :fdesdep, -> { where.not(id: nil) })       
    search != "" ? (scope :fhastap, -> { where(['created_at < ?', search]) }) : (scope :fhastap, -> { where.not(id: nil) })   
    search2 != "" ? (scope :tipop, -> { where(tipo: search2) }) : (scope :tipop, -> { where.not(id: nil) })   
    search3 != "" ? (scope :employedop, -> { where(employed_id: search3) }) : (scope :employedop, -> { where.not(id: nil) }) 
    search5 != "" ? (scope :descop, -> { where("description like '%#{search5.downcase}%' or description like '%#{search5.upcase}%'  or description like '%#{search5.capitalize}%' or state like '%#{search5.downcase}%' or state like '%#{search5.capitalize}%' ") }) : (scope :descop, -> { where.not(id: nil) }) 
    search6 != "" ? (scope :estadop, -> { where(state: search6) }) : (scope :estadop, -> { where.not(id: nil) }) 

  
        employedop.tipop.descop.estadop.fdesdep.fhastap

     #begin if search2 != ""
       #   where("description like '%#{search5.downcase}%' or description like '%#{search5.upcase}%'  or description like '%#{search5.capitalize}%' or state like '%#{search5.downcase}%' or state like '%#{search5.capitalize}%' ").where(source_id: search2).employedp
      #else
       #   where("description like '%#{search.downcase}%' or description like '%#{search.upcase}%'  or description like '%#{search.capitalize}%' or state like '%#{search.downcase}%' or state like '%#{search.capitalize}%' ")
      #end

  end	





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
 

 