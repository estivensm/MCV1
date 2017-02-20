# == Schema Information
#
# Table name: causas
#
#  id          :integer          not null, primary key
#  tipo        :string
#  descripcion :text
#  archivo     :string
#  admin_user  :integer
#  user_id     :integer
#  report_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  primera_m   :string
#  seguna_m    :string
#  tercera_m   :string
#  cuarta_m    :string
#  quinta_m    :string
#  sexta_m     :string
#

require 'test_helper'

class CausaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
