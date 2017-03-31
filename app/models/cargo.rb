# == Schema Information
#
# Table name: cargos
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  proceso_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  admin_user  :integer
#

class Cargo < ApplicationRecord
	belongs_to :proceso
	belongs_to :user
	has_many :employeds

def self.search(search, search1, search2)
	
            search != "" ? (scope :namesc, -> { where("name like '%#{search.downcase}%' or name like '%#{search.upcase}%'  or name like '%#{search.capitalize}%' ") }) : (scope :namesc, -> { where.not(id: nil) }) 
            search1 != "" ? (scope :descriptionsc, -> { where("description like '%#{search1.downcase}%' or description like '%#{search1.upcase}%'  or description like '%#{search1.capitalize}%' ") }) : (scope :descriptionsc, -> { where.not(id: nil) }) 
            search2 != "" ? (scope :procesosc, -> { where(proceso_id: search2) }) : (scope :procesosc, -> { where.not(id: nil) })
            namesc.descriptionsc.procesosc


             end



end
