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
