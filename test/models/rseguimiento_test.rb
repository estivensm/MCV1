# == Schema Information
#
# Table name: rseguimientos
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  admin_user    :integer
#  f_seguimiento :date
#  descripcion   :text
#  report_id     :integer
#  evidencia     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  s_cierre      :boolean
#  cerrar        :boolean
#  eficaz        :boolean
#  conclucion    :text
#  send_mail     :boolean
#  type_tracing  :string
#

require 'test_helper'

class RseguimientoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
