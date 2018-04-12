# == Schema Information
#
# Table name: reports
#
#  id                    :integer          not null, primary key
#  employed_id           :integer
#  proceso_id            :integer
#  description           :text
#  requisito             :text
#  evidencia             :text
#  nc_type               :string
#  accion                :string
#  justificacion         :text
#  user_id               :integer
#  admin_user            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  state                 :string
#  codigo                :string
#  contador              :integer
#  source_id             :integer
#  archivo               :string
#  employed_reporta      :integer
#  f_seguimiento         :integer
#  f_compromiso          :date
#  f_real                :date
#  fp_seguimiento        :date
#  contador_seg          :integer
#  costo                 :integer
#  cumplio               :boolean
#  clinte_proveedor_id   :integer
#  contact_id            :integer
#  tag                   :boolean
#  cierra_id             :integer
#  name                  :string
#  balon                 :string
#  s_cierre              :boolean
#  eficaz                :boolean
#  conclucion            :text
#  change_cumplio        :boolean
#  justificacion_cumplio :text
#  send_mail             :boolean
#  source_parent_id      :integer
#  costo_presupuestado   :integer
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
