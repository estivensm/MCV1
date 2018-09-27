# == Schema Information
#
# Table name: rols
#
#  id              :integer          not null, primary key
#  admin_user      :integer
#  user_id         :integer
#  configuracion   :boolean
#  report_ver      :boolean
#  report_crear    :boolean
#  report_edit     :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string
#  report_delete   :boolean
#  report_procesos :boolean
#  default         :boolean
#  create_all      :boolean
#

require 'test_helper'

class RolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
