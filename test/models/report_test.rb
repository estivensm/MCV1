# == Schema Information
#
# Table name: reports
#
#  id            :integer          not null, primary key
#  source        :string
#  employed_id   :integer
#  proceso_id    :integer
#  description   :text
#  requisito     :text
#  evidencia     :text
#  nc_type       :string
#  accion        :string
#  justificacion :text
#  user_id       :integer
#  admin_user    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
