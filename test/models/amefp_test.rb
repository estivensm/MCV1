# == Schema Information
#
# Table name: amefps
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  admin_user     :integer
#  report_id      :integer
#  causa_id       :integer
#  descripcion    :text
#  employed_id    :integer
#  p_valoracion   :boolean
#  frp_valoracion :date
#  dp_valoracion  :text
#  p_valor        :integer
#  s_valoracion   :boolean
#  frs_valoracion :date
#  ds_valoracion  :text
#  s_valor        :integer
#  t_valoracion   :boolean
#  frt_valoracion :date
#  dt_valoracion  :text
#  t_valor        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  npr_tage       :integer
#

require 'test_helper'

class AmefpTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
