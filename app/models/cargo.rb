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
#

class Cargo < ApplicationRecord
	belongs_to :proceso
	has_and_belongs_to_many :users
end
