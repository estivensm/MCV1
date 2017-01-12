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

require 'test_helper'

class NumeralReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
