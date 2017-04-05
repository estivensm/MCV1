# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  admin_user   :integer
#  employed_id  :integer
#  report_id    :integer
#  name         :string
#  observacion  :text
#  costo        :integer
#  f_compromiso :date
#  f_real       :date
#  estado       :boolean
#  cumplio      :boolean
#  contador     :integer
#  contador_seg :integer
#  anexo        :string
#  codigo       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Task < ApplicationRecord
	belongs_to :report
	belongs_to :user
	belongs_to :employed
	mount_uploader :anexo, AnexoTaskUploader
    after_create :start_must_be_before_end_time
	scope :cerradas, -> { where(estado: true) }
    scope :abiertas, -> { where(estado: false) }



 def start_must_be_before_end_time
      
      

        @times = self.f_compromiso.to_time
        @time =  @times.to_i - Time.now.to_i  
        self.contador_seg = (@time / 60 / 60/ 24) + 1
        save

       
            
     
        
    

  end


end
