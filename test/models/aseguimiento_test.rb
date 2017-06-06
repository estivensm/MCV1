# == Schema Information
#
# Table name: aseguimientos
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  admin_user    :integer
#  f_seguimiento :date
#  descripcion   :text
#  cierra        :boolean
#  eficaz        :boolean
#  conclucion    :text
#  costo         :integer
#  evidencia     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  accion_id     :integer
#  s_cierre      :boolean
#  send_mail     :boolean
#

require 'test_helper'

class AseguimientoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
