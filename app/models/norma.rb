# == Schema Information
#
# Table name: normas
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  admin_user :integer
#  archivo    :string
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tipo       :boolean
#

class Norma < ApplicationRecord

	belongs_to :user
	has_many :numerals , dependent: :destroy
	mount_uploader :archivo, ArchivoUploader
	after_create :validar_tipo


	def validar_tipo
        user = User.where(admin: true).take
        if self.admin_user  == user.id

                self.tipo = true
                save

        end

            

      
            
	end
  

def self.search(search)
           search!= "" ? (scope :namesc, -> { where("name like '%#{search.downcase}%' or name like '%#{search.upcase}%'  or name like '%#{search.capitalize}%' ") }) : (scope :namesc, -> { where.not(id: nil) }) 
 
     namesc
        end

end
