# == Schema Information
#
# Table name: amefs
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  admin_user      :integer
#  report_id       :integer
#  causa_id        :integer
#  efecto_fallo    :string
#  grado           :integer
#  tipo            :string
#  modo_fallo      :string
#  causa_fallo     :string
#  p_ocurrencia    :integer
#  c_actuales      :string
#  pn_deteccion    :integer
#  npr             :integer
#  employed_id     :integer
#  sgrado          :integer
#  tgrado          :integer
#  sp_ocurrencia   :integer
#  tp_ocurrencia   :integer
#  spn_deteccion   :integer
#  tpn_deteccion   :integer
#  snpr            :integer
#  tnpr            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  amefp_id        :integer
#  causa_efecto_id :integer
#  a_tomar         :string
#  estado          :string
#  sestado         :string
#  testado         :string
#

class Amef < ApplicationRecord
	belongs_to :causa_efecto
	belongs_to :amefp
end
