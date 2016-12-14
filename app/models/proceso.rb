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
	validates :name, presence: true
	belongs_to :user
	has_many :cargos
end
