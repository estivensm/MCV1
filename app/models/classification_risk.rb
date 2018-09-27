# == Schema Information
#
# Table name: classification_risks
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  admin_user  :integer
#  name        :string
#  description :text
#  context     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ClassificationRisk < ApplicationRecord
	has_many :riesgos
end
