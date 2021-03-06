# == Schema Information
#
# Table name: accions
#
#  id                    :integer          not null, primary key
#  codigo                :string
#  employed_id           :string
#  descripcion           :text
#  tipo                  :string
#  costo                 :integer
#  f_seguimiento         :integer
#  f_compromiso          :date
#  f_real                :date
#  estado                :string
#  cumplio               :boolean
#  contador              :integer
#  evidencia             :text
#  contador_seg          :integer
#  user_id               :integer
#  admin_user            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  report_id             :integer
#  fp_seguimiento        :date
#  tag                   :boolean
#  eficaz                :boolean
#  cierra_id             :integer
#  name                  :string
#  s_cierre              :boolean
#  change_cumplio        :boolean
#  justificacion_cumplio :text
#  send_mail             :boolean
#  costo_presupuestado   :integer
#  estado_vencida        :boolean
#  estado_proxima        :boolean
#  estado_vigente        :boolean
#

require 'test_helper'

class AccionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
