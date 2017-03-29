# == Schema Information
#
# Table name: riesgos
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  admin_user    :integer
#  report_id     :integer
#  accion_id     :integer
#  descripcion   :text
#  clasificacion :string
#  nivel         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class RiesgoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
