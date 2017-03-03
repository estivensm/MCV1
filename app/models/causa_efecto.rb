# == Schema Information
#
# Table name: causa_efectos
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  admin_user  :integer
#  nivel       :string
#  descripcion :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tipo        :string
#  report_id   :integer
#  causa_id    :integer
#  name        :string
#  frecuencia  :integer
#  porcentaje  :float
#  estado      :string
#

class CausaEfecto < ApplicationRecord
	belongs_to :user
	belongs_to :report
	belongs_to :causa  , inverse_of: :causa_efectos
	has_many :amefs, dependent: :destroy
	after_create :crear_amef

	def crear_amef

        if Amefp.where(causa_id: self.causa_id).count != 0
        amefp = Amefp.where(causa_id: self.causa_id).first
       Amef.create(causa_efecto_id:self.id, admin_user:self.admin_user, user_id:self.user_id, report_id: self.report_id, causa_id:self.causa_id, efecto_fallo: amefp.descripcion, grado: amefp.p_valor,modo_fallo: self.causa.primera_m, causa_fallo: self.name,p_ocurrencia:0,pn_deteccion:0,npr:0, amefp_id: amefp.id, tipo: self.nivel)


        end

	end

end
