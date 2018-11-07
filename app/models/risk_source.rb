# == Schema Information
#
# Table name: risk_sources
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  admin_user  :integer
#  name        :string
#  description :text
#  code        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RiskSource < ApplicationRecord
	has_many :riesgos
end
