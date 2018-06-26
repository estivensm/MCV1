# == Schema Information
#
# Table name: tasks
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  admin_user            :integer
#  employed_id           :integer
#  report_id             :integer
#  name                  :string
#  observacion           :text
#  costo                 :integer
#  f_compromiso          :date
#  f_real                :date
#  estado                :boolean
#  cumplio               :boolean
#  contador              :integer
#  contador_seg          :integer
#  anexo                 :string
#  codigo                :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  change_cumplio        :boolean
#  justificacion_cumplio :text
#  send_mail             :boolean
#  accion_id             :integer
#  estado_vencida        :boolean
#  estado_proxima        :boolean
#  estado_vigente        :boolean
#

class Task < ApplicationRecord
	belongs_to :report
  belongs_to :accion
	belongs_to :user
	belongs_to :employed
	mount_uploader :anexo, AnexoTaskUploader
  after_create :generar_fechas_create
  before_update :generar_fechas_update
  before_update :cerrar_task
	scope :cerradas, -> { where(estado: true) }
  scope :abiertas, -> { where(estado: false) }
  scope :vigentes, -> { where('contador_seg > ?', 5) }
  scope :proximas, -> { where('contador_seg >= ?', 0).where('contador_seg <= ?', 5) }
  scope :vencidas, -> { where('contador_seg < ?', 0) }
  scope :alerta, -> { where('contador_seg <= ?', 5) }




 def self.search(search0,search, search5)

   #search6 = search6.chomp("s") if search6 != ""

    
      
    search0 != "" ? (scope :fdesdep, -> { where(['created_at > ?', search0]) }) : (scope :fdesdep, -> { where.not(id: nil) })       
    search != "" ? (scope :fhastap, -> { where(['created_at < ?', search]) }) : (scope :fhastap, -> { where.not(id: nil) })   
    #search2 != "" ? (scope :sourceop, -> { where(source_id: search2) }) : (scope :sourceop, -> { where.not(id: nil) })   
   # search3 != "" ? (scope :employedop, -> { where(employed_id: search3) }) : (scope :employedop, -> { where.not(id: nil) }) 
    #search4 != "" ? (scope :procesop, -> { where(proceso_id: search4) }) : (scope :procesop, -> { where.not(id: nil) }) 
    search5 != "" ? (scope :descop, -> { where("name like '%#{search5.downcase}%' or name like '%#{search5.upcase}%'  or name like '%#{search5.capitalize}%'  ") }) : (scope :descop, -> { where.not(id: nil) }) 
    #search6 != "" ? (scope :estadop, -> { where(state: search6) }) : (scope :estadop, -> { where.not(id: nil) }) 

  
        descop.fdesdep.fhastap

     #begin if search2 != ""
       #   where("description like '%#{search5.downcase}%' or description like '%#{search5.upcase}%'  or description like '%#{search5.capitalize}%' or state like '%#{search5.downcase}%' or state like '%#{search5.capitalize}%' ").where(source_id: search2).employedp
      #else
       #   where("description like '%#{search.downcase}%' or description like '%#{search.upcase}%'  or description like '%#{search.capitalize}%' or state like '%#{search.downcase}%' or state like '%#{search.capitalize}%' ")
      #end

  end

 def generar_fechas_create
      
      

        @times = self.f_compromiso.to_time
        @time =  @times.to_i - Time.now.to_i  
        self.contador_seg = (@time / 60 / 60/ 24) + 1
        save
        employed = Employed.find(self.employed_id)
        #CreateMailer.create_task(employed,self).deliver
            
     
        
    

  end
   def generar_fechas_update
      
      

        @times = self.f_compromiso.to_time
        @time =  @times.to_i - Time.now.to_i  
        self.contador_seg = (@time / 60 / 60/ 24) + 1
        
        employed = Employed.find(self.employed_id)
        #CreateMailer.create_task(employed,self).deliver
            
     
        
    

  end


  def cerrar_task


 if self.estado 

          
            self.f_compromiso >= Time.now.to_date ? (self.cumplio = true) : (self.cumplio = false)
            self.f_real = Time.now
           
            
          
    end


 if self.change_cumplio
 
      self.cumplio = true
 end   
       
  end


end
