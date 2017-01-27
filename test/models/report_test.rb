# == Schema Information
#
# Table name: reports
#
#  id               :integer          not null, primary key
#  employed_id      :integer
#  proceso_id       :integer
#  description      :text
#  requisito        :text
#  evidencia        :text
#  nc_type          :string
#  accion           :string
#  justificacion    :text
#  user_id          :integer
#  admin_user       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  state            :string
#  codigo           :string
#  contador         :integer
#  source_id        :integer
#  archivo          :string
#  employed_reporta :integer
#  f_seguimiento    :integer
#  f_compromiso     :date
#  f_real           :date
#  fp_seguimiento   :date
#  contador_seg     :integer
#  costo            :integer
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
