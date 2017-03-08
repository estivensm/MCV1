# == Schema Information
#
# Table name: causas
#
#  id          :integer          not null, primary key
#  tipo        :string
#  descripcion :text
#  archivo     :string
#  admin_user  :integer
#  user_id     :integer
#  report_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  primera_m   :string
#  seguna_m    :string
#  tercera_m   :string
#  cuarta_m    :string
#  quinta_m    :string
#  sexta_m     :string
#

class Causa < ApplicationRecord
	belongs_to :report
	mount_uploader :archivo, ArchivoCausaUploader
	validates :tipo, presence: true 
	has_many :causa_efectos, inverse_of: :causa, dependent: :destroy
	accepts_nested_attributes_for :causa_efectos, :allow_destroy => true
	after_create :eliminar_causas_basura
	after_update :crear_porcentaje
	has_many :amefps , dependent: :destroy

        
	def eliminar_causas_basura

		causa_basuara = CausaEfecto.where(causa_id: self.id).where.not(tipo: self.tipo)
		causa_basuara.destroy_all
		


        
	end

	def crear_porcentaje

if self.tipo == "Pareto"
        sum = CausaEfecto.where(causa_id: self.id).sum(:frecuencia)
        CausaEfecto.where(causa_id: self.id).update_all(porcentaje: 0)
        sump = 0
        CausaEfecto.where(causa_id: self.id).order(frecuencia: :desc).each do |causa|
            
            
            porc = ((causa.frecuencia.to_f / sum) * 100).round(0) 
           
            causa.porcentaje = porc + sump 
            sump = causa.porcentaje
            
            if sump > 100
            causa.porcentaje = 100
            puts "hoollllllllllllllllllllllalllllllllllllllllllllllllllllll"
            end

            if sump <= 80
                causa.estado = "vital"
                
            else
                   causa.estado = "tribial" 
                   
            end

                 causa.save
        end


end

	end

end
