# == Schema Information
#
# Table name: reports
#
#  id                    :integer          not null, primary key
#  employed_id           :integer
#  proceso_id            :integer
#  description           :text
#  requisito             :text
#  evidencia             :text
#  nc_type               :string
#  accion                :string
#  justificacion         :text
#  user_id               :integer
#  admin_user            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  state                 :string
#  codigo                :string
#  contador              :integer
#  source_id             :integer
#  archivo               :string
#  employed_reporta      :integer
#  f_seguimiento         :integer
#  f_compromiso          :date
#  f_real                :date
#  fp_seguimiento        :date
#  contador_seg          :integer
#  costo                 :integer
#  cumplio               :boolean
#  clinte_proveedor_id   :integer
#  contact_id            :integer
#  tag                   :boolean
#  cierra_id             :integer
#  name                  :string
#  balon                 :string
#  s_cierre              :boolean
#  eficaz                :boolean
#  conclucion            :text
#  change_cumplio        :boolean
#  justificacion_cumplio :text
#  send_mail             :boolean
#  source_parent_id      :integer
#

class Report < ApplicationRecord
  has_and_belongs_to_many :employeds, dependent: :destroy
  belongs_to :cierra, :class_name => 'Employed'
  belongs_to :employed, :class_name => 'Employed'
  belongs_to :source_parent
  has_and_belongs_to_many :numerals, dependent: :destroy
  belongs_to :source
  belongs_to :clinte_proveedor
  belongs_to :proceso
  belongs_to :contact
  has_many :tasks , dependent: :destroy
  belongs_to :user
  has_many :accions, dependent: :destroy
  has_many :rseguimientos, dependent: :destroy
  has_many :causas, dependent: :destroy
  has_many :causa_efectos, dependent: :destroy
  after_create :accions_create
  mount_uploader :archivo, ArchivoReportUploader
  validate :archivo_size_validation, :if => "archivo?"  
  validate :start_must_be_before_end_time, on: [:create, :update]
  validates :employed_id, :proceso_id, :source_id,:source_parent_id ,:name,:employed_reporta,:cierra_id ,:f_compromiso,presence: true

 scope :cerrados, -> { where(state: "Cerrado") }
scope :abiertos, -> { where(state: "Abierto") }


  def archivo_size_validation
      
      errors[:archivo] << "should be less than 1MB" if archivo.size > 1.megabytes
  
  end

  def start_must_be_before_end_time
      
      if self.tag 

        self.fp_seguimiento = Time.at(Time.now.to_i + (self.f_seguimiento*60*60*24))
        @times = self.f_compromiso.to_time
        @time =  @times.to_i - Time.now.to_i  
        self.contador_seg = (@time / 60 / 60/ 24) + 1
        errors.add(:La, " frecuencia de seguimiento no puede ser mayor a la fecha de compromiso") unless
        self.contador_seg > self.f_seguimiento
       

     
        
      end

  end


  
 def self.search(search,search0, search2, search3, search4, search5, search6)

   #search6 = search6.chomp("s") if search6 != ""

    
      
    search0 != "" ? (scope :fdesdep, -> { where(['created_at > ?', search0]) }) : (scope :fdesdep, -> { where.not(id: nil) })       
    search != "" ? (scope :fhastap, -> { where(['created_at < ?', search]) }) : (scope :fhastap, -> { where.not(id: nil) })   
    search2 != "" ? (scope :sourceop, -> { where(source_id: search2) }) : (scope :sourceop, -> { where.not(id: nil) })   
    search3 != "" && search3 != nil ? (scope :employedop, -> { where(employed_id: search3) }) : (scope :employedop, -> { where.not(id: nil) }) 
    search4 != "" ? (scope :procesop, -> { where(proceso_id: search4) }) : (scope :procesop, -> { where.not(id: nil) }) 
    search5 != "" ? (scope :descop, -> { where("name like '%#{search5.downcase}%' or name like '%#{search5.upcase}%'  or name like '%#{search5.capitalize}%'  ") }) : (scope :descop, -> { where.not(id: nil) }) 
    search6 != "" ? (scope :clientep, -> { where(clinte_proveedor_id: search6) }) : (scope :clientep, -> { where.not(id: nil) }) 

  
        employedop.sourceop.procesop.descop.fdesdep.fhastap.clientep

     #begin if search2 != ""
       #   where("description like '%#{search5.downcase}%' or description like '%#{search5.upcase}%'  or description like '%#{search5.capitalize}%' or state like '%#{search5.downcase}%' or state like '%#{search5.capitalize}%' ").where(source_id: search2).employedp
      #else
       #   where("description like '%#{search.downcase}%' or description like '%#{search.upcase}%'  or description like '%#{search.capitalize}%' or state like '%#{search.downcase}%' or state like '%#{search.capitalize}%' ")
      #end

  end

  def accions_create
       
  end

      
        

end
