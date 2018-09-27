# == Schema Information
#
# Table name: valoration_risks
#
#  id                    :integer          not null, primary key
#  controls              :boolean
#  np_value              :integer
#  ne_value              :integer
#  nd_value              :integer
#  np_text               :string
#  ne_text               :string
#  nd_text               :string
#  nc_value              :integer
#  nc_text               :string
#  probability_indicator :text
#  impact_indicator      :text
#  nr_value              :integer
#  risk_level            :string
#  user_id               :integer
#  admin_user            :integer
#  riesgo_id             :integer
#  next_valoration       :date
#  valoration_date       :date
#  analysis              :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class ValorationRiskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
