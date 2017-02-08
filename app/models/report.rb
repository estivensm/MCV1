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
#  f_seguimiento    :integer
#  f_compromiso     :date
#  f_real           :date
#  fp_seguimiento   :date
#  contador_seg     :integer
#  costo            :integer
#  cumplio          :boolean
#

class Report < ApplicationRecord
  has_and_belongs_to_many :employeds
  has_and_belongs_to_many :numerals
  belongs_to :source
  belongs_to :proceso
  belongs_to :user
  has_many :accions
  has_many :rseguimientos
  has_many :causas
  after_create :accions_create
  mount_uploader :archivo, ArchivoReportUploader
  validate :archivo_size_validation, :if => "archivo?"  
  before_destroy :delete_accions
  validate :start_must_be_before_end_time

  def archivo_size_validation
      
      errors[:archivo] << "should be less than 1MB" if archivo.size > 1.megabytes
  
  end

  def start_must_be_before_end_time
      self.fp_seguimiento = Time.at(Time.now.to_i + (self.f_seguimiento*60*60*24))
        @times = self.f_compromiso.to_time
        @time =  @times.to_i - Time.now.to_i  
        self.contador_seg = (@time / 60 / 60/ 24) + 1
        errors.add(:La, " frecuencia de seguimiento no puede ser mayor a la fecha de compromiso") unless
        self.contador_seg > self.f_seguimiento

  end


  
 def self.search(search0,search, search2, search3, search4, search5, search6)

   search6 = search6.chomp("s") if search6 != ""

    
      
    search0 != "" ? (scope :fdesdep, -> { where(['created_at > ?', search0]) }) : (scope :fdesdep, -> { where.not(id: nil) })       
    search != "" ? (scope :fhastap, -> { where(['created_at < ?', search]) }) : (scope :fhastap, -> { where.not(id: nil) })   
    search2 != "" ? (scope :sourceop, -> { where(source_id: search2) }) : (scope :sourceop, -> { where.not(id: nil) })   
    search3 != "" ? (scope :employedop, -> { where(employed_id: search3) }) : (scope :employedop, -> { where.not(id: nil) }) 
    search4 != "" ? (scope :procesop, -> { where(proceso_id: search4) }) : (scope :procesop, -> { where.not(id: nil) }) 
    search5 != "" ? (scope :descop, -> { where("description like '%#{search5.downcase}%' or description like '%#{search5.upcase}%'  or description like '%#{search5.capitalize}%' or state like '%#{search5.downcase}%' or state like '%#{search5.capitalize}%' ") }) : (scope :descop, -> { where.not(id: nil) }) 
    search6 != "" ? (scope :estadop, -> { where(state: search6) }) : (scope :estadop, -> { where.not(id: nil) }) 

  
        employedop.sourceop.procesop.descop.estadop.fdesdep.fhastap

     #begin if search2 != ""
       #   where("description like '%#{search5.downcase}%' or description like '%#{search5.upcase}%'  or description like '%#{search5.capitalize}%' or state like '%#{search5.downcase}%' or state like '%#{search5.capitalize}%' ").where(source_id: search2).employedp
      #else
       #   where("description like '%#{search.downcase}%' or description like '%#{search.upcase}%'  or description like '%#{search.capitalize}%' or state like '%#{search.downcase}%' or state like '%#{search.capitalize}%' ")
      #end

  end

  def accions_create



      self.employeds.each do |employed|
	      
      ReportMailer.noty_report(employed, self).deliver
          
	  end
  end

      
  def delete_accions
    Rseguimiento.where(report_id:self.id).destroy_all
    self.accions.each do |acc|
        Aseguimiento.where(accion_id: acc.id).destroy_all
    end
    Accion.where(report_id: self.id).destroy_all
    Causa.where(report_id: self.id).destroy_all


  end         

end
