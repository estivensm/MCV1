# == Schema Information
#
# Table name: amefps
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  admin_user     :integer
#  report_id      :integer
#  causa_id       :integer
#  descripcion    :text
#  employed_id    :integer
#  p_valoracion   :boolean
#  frp_valoracion :date
#  dp_valoracion  :text
#  p_valor        :integer
#  s_valoracion   :boolean
#  frs_valoracion :date
#  ds_valoracion  :text
#  s_valor        :integer
#  t_valoracion   :boolean
#  frt_valoracion :date
#  dt_valoracion  :text
#  t_valor        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  npr_tage       :integer
#:f_compromiso,presence: true

class Amefp < ApplicationRecord
	after_create :crear_amef
	belongs_to  :causa
	has_many :amefs, dependent: :destroy
    validates :p_valor,  presence: true

    def crear_amef
            causa = Causa.find(self.causa_id)
        CausaEfecto.where(causa_id: self.causa_id).where(nivel: "1").each do | n1 |
            Amef.create(causa_efecto_id:n1.id, admin_user:self.admin_user, user_id:self.user_id, report_id: self.report_id, causa_id:self.causa_id, efecto_fallo: causa.descripcion, grado: self.p_valor,modo_fallo: causa.primera_m, causa_fallo: n1.name,p_ocurrencia:0,pn_deteccion:0,npr:0, amefp_id:self.id, tipo: n1.nivel)
        end  
        CausaEfecto.where(causa_id: self.causa_id).where(nivel: "2").each do | n1 |
            Amef.create(causa_efecto_id:n1.id, admin_user:self.admin_user, user_id:self.user_id, report_id: self.report_id, causa_id:self.causa_id, efecto_fallo: causa.descripcion, grado: self.p_valor,modo_fallo: causa.seguna_m, causa_fallo: n1.name,p_ocurrencia:0,pn_deteccion:0,npr:0, amefp_id:self.id, tipo:n1.nivel)
        end
        CausaEfecto.where(causa_id: self.causa_id).where(nivel: "3").each do | n1 |
            Amef.create(causa_efecto_id:n1.id, admin_user:self.admin_user, user_id:self.user_id, report_id: self.report_id, causa_id:self.causa_id, efecto_fallo: causa.descripcion, grado: self.p_valor,modo_fallo: causa.tercera_m, causa_fallo: n1.name,p_ocurrencia:0,pn_deteccion:0,npr:0, amefp_id:self.id, tipo:n1.nivel)
        end
        CausaEfecto.where(causa_id: self.causa_id).where(nivel: "4").each do | n1 |
            Amef.create(causa_efecto_id:n1.id, admin_user:self.admin_user, user_id:self.user_id, report_id: self.report_id, causa_id:self.causa_id, efecto_fallo: causa.descripcion, grado: self.p_valor,modo_fallo: causa.cuarta_m, causa_fallo: n1.name,p_ocurrencia:0,pn_deteccion:0,npr:0, amefp_id:self.id, tipo:n1.nivel)
        end  
         CausaEfecto.where(causa_id: self.causa_id).where(nivel: "5").each do | n1 |
            Amef.create(causa_efecto_id:n1.id, admin_user:self.admin_user, user_id:self.user_id, report_id: self.report_id, causa_id:self.causa_id, efecto_fallo: causa.descripcion, grado: self.p_valor,modo_fallo: causa.quinta_m, causa_fallo: n1.name,p_ocurrencia:0,pn_deteccion:0,npr:0, amefp_id:self.id, tipo:n1.nivel)
        end 
         CausaEfecto.where(causa_id: self.causa_id).where(nivel: "6").each do | n1 |
            Amef.create(causa_efecto_id:n1.id, admin_user:self.admin_user, user_id:self.user_id, report_id: self.report_id, causa_id:self.causa_id, efecto_fallo: causa.descripcion, grado: self.p_valor,modo_fallo: causa.sexta_m, causa_fallo: n1.name,p_ocurrencia:0,pn_deteccion:0,npr:0, amefp_id:self.id, tipo:n1.nivel)
        end 


    end

end

