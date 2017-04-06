# == Schema Information
#
# Table name: numerals
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  admin_user  :integer
#  norma_id    :integer
#  description :text
#  numeral     :string
#  norma_name  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Numeral < ApplicationRecord
belongs_to :user
belongs_to :norma
has_and_belongs_to_many :reports

def self.search(search, search1, search2)
	
            search != "" ? (scope :numeralsc, -> { where("numeral like '%#{search.downcase}%' or numeral like '%#{search.upcase}%'  or numeral like '%#{search.capitalize}%' ") }) : (scope :numeralsc, -> { where.not(id: nil) }) 
            search1 != "" ? (scope :descriptionsc, -> { where("description like '%#{search1.downcase}%' or description like '%#{search1.upcase}%'  or description like '%#{search1.capitalize}%' ") }) : (scope :descriptionsc, -> { where.not(id: nil) }) 
            search2 != "" ? (scope :namesc, -> { where("name like '%#{search2.downcase}%' or name like '%#{search2.upcase}%'  or name like '%#{search2.capitalize}%' ") }) : (scope :namesc, -> { where.not(id: nil) }) 
            numeralsc.descriptionsc.namesc


             end

end
