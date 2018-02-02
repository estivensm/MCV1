# == Schema Information
#
# Table name: source_parents
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  user_id     :integer
#  admin_user  :integer
#  codigo      :string
#  tipo        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SourceParent < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :sources, dependent: :destroy
	has_many :reports
	def self.search(search, search1)
           search!= "" ? (scope :namesc, -> { where("name like '%#{search.downcase}%' or name like '%#{search.upcase}%'  or name like '%#{search.capitalize}%' ") }) : (scope :namesc, -> { where.not(id: nil) }) 
                      search1 != "" ? (scope :descriptionsc, -> { where("descripcion like '%#{search1.downcase}%' or descripcion like '%#{search1.upcase}%'  or description like '%#{search1.capitalize}%' ") }) : (scope :descriptionsc, -> { where.not(id: nil) }) 
 
     namesc.descriptionsc
        end
end
