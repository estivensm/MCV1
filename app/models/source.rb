# == Schema Information
#
# Table name: sources
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  admin_user  :integer
#  state       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  default     :boolean
#  accion      :boolean
#  correccion  :boolean
#  causa       :boolean
#  puede_ac    :boolean
#  codigo      :string
#  tipo        :string
#  balon       :boolean
#  evidencia   :boolean
#  requisito   :boolean
#  numerales   :boolean
#  task        :boolean
#  actividad   :boolean
#











class Source < ApplicationRecord
	has_many :reports
	after_create :validar_default, dependent: :destroy
	def self.search(search,search1, search2)

   search1 = search1.chomp("s") if search1 != ""

    
      
    
    search != "" ? (scope :namesc, -> { where("name like '%#{search.downcase}%' or name like '%#{search.upcase}%'  or name like '%#{search.capitalize}%'  ") }) : (scope :namesc, -> { where.not(id: nil) }) 
    search1 != "" ? (scope :tiposc, -> { where(tipo: search1) }) : (scope :tiposc, -> { where.not(id: nil) }) 
    search2 != "" ? (scope :dessc, -> { where("description like '%#{search2.downcase}%' or description like '%#{search2.upcase}%'  or description like '%#{search2.capitalize}%'  ") }) : (scope :dessc, -> { where.not(id: nil) }) 

  
        namesc.tiposc.dessc

   

  end

        def validar_default

           sources = Source.where(admin_user: self.admin_user).count
           self.default = true if sources == 1 
           save
         
             

        end
end
