# == Schema Information
#
# Table name: numeral_reports
#
#  id         :integer          not null, primary key
#  comment    :text
#  numeral_id :integer
#  report_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NumeralReport < ApplicationRecord
	belongs_to :report,inverse_of: :numeral_reports
end
