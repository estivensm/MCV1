# == Schema Information
#
# Table name: causa_efectos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  admin_user :integer
#  nivel      :string
#  causa      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tipo       :string
#  report_id  :integer
#  causa_id   :integer
#

class CausaEfecto < ApplicationRecord
	belongs_to :user
	belongs_to :report
	belongs_to :causa
end
