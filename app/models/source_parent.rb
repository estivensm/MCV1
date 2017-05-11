class SourceParent < ApplicationRecord
	belongs_to :user
	has_many :reports
	def self.search(search, search1)
           search!= "" ? (scope :namesc, -> { where("name like '%#{search.downcase}%' or name like '%#{search.upcase}%'  or name like '%#{search.capitalize}%' ") }) : (scope :namesc, -> { where.not(id: nil) }) 
                      search1 != "" ? (scope :descriptionsc, -> { where("descripcion like '%#{search1.downcase}%' or descripcion like '%#{search1.upcase}%'  or description like '%#{search1.capitalize}%' ") }) : (scope :descriptionsc, -> { where.not(id: nil) }) 
 
     namesc.descriptionsc
        end
end
