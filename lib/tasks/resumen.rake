namespace :resumen do
  desc "Sends the most voted products created yesterday"
  task actividad: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
        

                Employed.all.each do |empleado|
                	@reports_alarma_vencido = []
                	@reports_alarma_proximo = []
                	@reports_alarma_hoy = []
                    @reports_seguimiento = []
                    @accion_alarma_vencido = []
                	@accion_alarma_proximo = []
                	@accion_alarma_hoy = []
                    @accion_seguimiento = []
                Report.where(state: "Abierto").where(employed_id: empleado.id).each do |report|
                    
                              
                                #if empleado.admin_user != 1
                                

                                times = report.f_compromiso.to_time
                                time =  times.to_i - Time.now.to_i
                                report.contador_seg = (time / 60 / 60/ 24) + 1

                                if report.contador_seg < 5 && report.contador_seg > 0
                                    
                                    @reports_alarma_proximo << report             
                                    #AlertaMailer.vencimiento_report(employed,report, "proximo").deliver
                                    
                                elsif report.contador_seg < 0
                                    
                                    @reports_alarma_vencido << report
                                    #AlertaMailer.vencimiento_report(employed,report, "vencido").deliver

                                elsif report.contador_seg == 0
                                    
                                    @reports_alarma_hoy << report    
                                    #AlertaMailer.vencimiento_report(employed,report, "hoy").deliver

                                end




                                
                                times1 = report.fp_seguimiento.to_time
                                time1 =  times1.to_i - Time.now.to_i
                                m = (time1 / 60 / 60/ 24) + 1
                                report.tag = false
                                report.save
                                
                                if m <= 0
                                    @reports_seguimiento << report
                                    #AlertaMailer.seguimiento_report(employed,report, "vencida").deliver
                                        
                                #elsif m == 0
        	                        #@reports_seguimiento << report
                                    #AlertaMailer.seguimiento_report(employed,report, "hoy").deliver


                                end
                            #end

                end 

                Accion.where(estado: "Abierta").where(employed_id: empleado.id).each do |accion|

                        #employed = Employed.find(accion.employed_id)    
                        #if employed.admin_user != 1
                        times = accion.f_compromiso.to_time
                        time =  times.to_i - Time.now.to_i
                        accion.contador_seg = (time / 60 / 60/ 24) + 1
                        accion.save
                        

                        if accion.contador_seg < 5 && accion.contador_seg > 0
                            @accion_alarma_proximo << accion
                            #AlertaMailer.vencimiento_accion(employed,accion,"proxima").deliver
                            
                        elsif accion.contador_seg < 0
                            @accion_alarma_vencido  << accion
                            #AlertaMailer.vencimiento_accion(employed,accion, "vencida").deliver

                        elsif accion.contador_seg == 0

                            @accion_alarma_hoy  << accion
                            #AlertaMailer.vencimiento_accion(employed,accion, "hoy").deliver
                            puts = "0000000000000"
                        end

                    

                    if accion.f_seguimiento != 0           
                        times1 = accion.fp_seguimiento.to_time
                        time1 =  times1.to_i - Time.now.to_i
                        m = (time1 / 60 / 60/ 24) + 1
                        accion.tag = false
                        accion.save
                        
                        if m <= 0 
                        
                            @accion_seguimiento << accion

                            
                            end
                      end
                    #end
                    end 

                @reports_alarma_vencido.each do |a|

        	            puts empleado.first_name
        	            #puts empleado.admin_user
        	            puts a.name
        	            puts "Report vencido"
                end 
                @reports_alarma_proximo.each do |a|

        	            puts empleado.first_name
        	            #puts empleado.admin_user
        	            puts a.name
        	            puts "Report proximo"
                end 
                @reports_alarma_hoy.each do |a|

        	            puts empleado.first_name
        	            #puts empleado.admin_user
        	            puts a.name
        	            puts "Repor hoy"
                end 
                @reports_seguimiento.each do |a|

        	            puts empleado.first_name
        	            #puts empleado.admin_user
        	            puts a.name
        	            puts "seguimeinto"
                end 

                puts "Accioness"
                @accion_alarma_vencido.each do |a|

        	            puts empleado.first_name
        	            #puts empleado.admin_user
        	            puts a.name
        	            puts "accion vencido"
                end 
                @accion_alarma_proximo.each do |a|

        	            puts empleado.first_name
        	            #puts empleado.admin_user
        	            puts a.name
        	            puts "accion proximo"
                end 
                @accion_alarma_hoy.each do |a|

        	            puts empleado.first_name
        	            #puts empleado.admin_user
        	            puts a.name
        	            puts "accion hoy"
                end 
                @accion_seguimiento.each do |a|

        	            puts empleado.first_name
        	            #puts empleado.admin_user
        	            puts a.name
        	            puts "accion seguimeinto"
                end 
                            AlertaMailer.resumen(empleado, @reports_alarma_vencido,@reports_alarma_proximo,@reports_alarma_hoy,@reports_seguimiento, @accion_alarma_vencido,@accion_alarma_proximo,@accion_alarma_hoy,@accion_seguimiento).deliver

            end    
            
    end
  end