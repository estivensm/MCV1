# == Schema Information
#
# Table name: procesos
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  admin_user  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Proceso < ApplicationRecord
	#validates :name, presence: true
	belongs_to :user
	has_many :cargos
	has_many :reports
	has_many :riesgos

	def self.search(search, search1)
           search!= "" ? (scope :namesc, -> { where("name like '%#{search.downcase}%' or name like '%#{search.upcase}%'  or name like '%#{search.capitalize}%' ") }) : (scope :namesc, -> { where.not(id: nil) }) 
                      search1 != "" ? (scope :descriptionsc, -> { where("description like '%#{search1.downcase}%' or description like '%#{search1.upcase}%'  or description like '%#{search1.capitalize}%' ") }) : (scope :descriptionsc, -> { where.not(id: nil) }) 
 
     namesc.descriptionsc
        end


      
end
