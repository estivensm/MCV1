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
#

class Source < ApplicationRecord
	has_many :reports
	after_create :validar_default
	def self.search(search)
            where("name like '%#{search}%' or description like '%#{search}%' "  )  
        end

        def validar_default

           sources = Source.where(admin_user: self.admin_user).count
           self.default = true if sources == 1 
           save
         
             

        end
end
