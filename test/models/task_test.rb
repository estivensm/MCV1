# == Schema Information
#
# Table name: tasks
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  admin_user            :integer
#  employed_id           :integer
#  report_id             :integer
#  name                  :string
#  observacion           :text
#  costo                 :integer
#  f_compromiso          :date
#  f_real                :date
#  estado                :boolean
#  cumplio               :boolean
#  contador              :integer
#  contador_seg          :integer
#  anexo                 :string
#  codigo                :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  change_cumplio        :boolean
#  justificacion_cumplio :text
#  send_mail             :boolean
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
