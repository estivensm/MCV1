class NumeralReport < ApplicationRecord
	belongs_to :report,inverse_of: :numeral_reports
end
