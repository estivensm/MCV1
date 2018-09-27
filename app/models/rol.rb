# == Schema Information
#
# Table name: rols
#
#  id              :integer          not null, primary key
#  admin_user      :integer
#  user_id         :integer
#  configuracion   :boolean
#  report_ver      :boolean
#  report_crear    :boolean
#  report_edit     :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string
#  report_delete   :boolean
#  report_procesos :boolean
#  default         :boolean
#  create_all      :boolean
#

class Rol < ApplicationRecord
	has_many :users
	has_many :employeds

	def self.search(search)
           search != "" ? (scope :namesc, -> { where("name like '%#{search.downcase}%' or name like '%#{search.upcase}%'  or name like '%#{search.capitalize}%' ") }) : (scope :namesc, -> { where.not(id: nil) }) 
 
     namesc
        end
end
