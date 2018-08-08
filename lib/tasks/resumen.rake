namespace :resumen do
  desc "Sends the most voted products created yesterday"
  task actividad: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
        

                Employed.all.each do |empleado|
                    if empleado.admin_user != 1
                	    @reports_alarma_vencido = []
                	    @reports_alarma_proximo = []
                	    #@reports_alarma_hoy = []
                        @reports_seguimiento = []
                        @accion_alarma_vencido = []
                	    @accion_alarma_proximo = []
                	    #@accion_alarma_hoy = []
                        @accion_seguimiento = []
                        @task_alarma_vencido = []
                        @task_alarma_proximo = []
                    #@task_alarma_hoy = []
                 
                          Report.where(state: "Abierto").where(employed_id: empleado.id).order(f_compromiso: :asc).each do |report|
                    
                              
                                #if empleado.admin_user != 1
                                

                                times = report.f_compromiso.to_time
                                time =  times.to_i - Time.now.to_i
                                report.contador_seg = (time / 60 / 60/ 24) + 1
                                puts report.contador_seg

                                if report.contador_seg <= 5 && report.contador_seg >= 0
                                    
                                    report.estado_vencida = false
                                    report.estado_proxima = true
                                    report.estado_vigente = false
                                    puts "entreeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
                                    @reports_alarma_proximo << report             
                                    #AlertaMailer.vencimiento_report(employed,report, "proximo").deliver
                                    
                                elsif report.contador_seg < 0
                                    
                                    report.estado_vencida = true
                                    report.estado_proxima = false
                                    report.estado_vigente = false
                                    @reports_alarma_vencido << report
                                    #AlertaMailer.vencimiento_report(employed,report, "vencido").deliver

                                #elsif report.contador_seg == 0
                                    
                                    #@reports_alarma_hoy << report    
                                    #AlertaMailer.vencimiento_report(employed,report, "hoy").deliver
                                else
                                    report.estado_vencida = false
                                    report.estado_proxima = false
                                    report.estado_vigente = true

                                end




                              if report.f_seguimiento != 0  
                                times1 = report.fp_seguimiento.to_time
                                time1 =  times1.to_i - Time.now.to_i
                                m = (time1 / 60 / 60/ 24) + 1
                                report.tag = false
                                
                                
                                if m <= 0
                                    @reports_seguimiento << report
                                    #AlertaMailer.seguimiento_report(employed,report, "vencida").deliver
                                        
                                #elsif m == 0
        	                        #@reports_seguimiento << report
                                    #AlertaMailer.seguimiento_report(employed,report, "hoy").deliver


                                end
                              end  
                                
                              report.save
                            #end

                end 

                Accion.where(estado: "Abierta").where(employed_id: empleado.id).order(f_compromiso: :asc).each do |accion|

                        #employed = Employed.find(accion.employed_id)    
                        #if employed.admin_user != 1
                        times = accion.f_compromiso.to_time
                        time =  times.to_i - Time.now.to_i
                        accion.contador_seg = (time / 60 / 60/ 24) + 1
                        puts "accionnnn"
                        puts accion.contador_seg
                        

                        if accion.contador_seg <= 5 && accion.contador_seg >= 0
                            accion.estado_vencida = false
                            accion.estado_proxima = true
                            accion.estado_vigente = false
                            puts "holiassssssssssssssssssssssss"
                            @accion_alarma_proximo << accion
                            #AlertaMailer.vencimiento_accion(employed,accion,"proxima").deliver
                            
                        elsif accion.contador_seg < 0 
                            accion.estado_vencida = true
                            accion.estado_proxima = false
                            accion.estado_vigente = false
                            @accion_alarma_vencido  << accion
                            #AlertaMailer.vencimiento_accion(employed,accion, "vencida").deliver

                        #elsif accion.contador_seg == 0
                        else
                            accion.estado_vencida = false
                            accion.estado_proxima = false
                            accion.estado_vigente = true
                            #accion_alarma_hoy  << accion
                            #AlertaMailer.vencimiento_accion(employed,accion, "hoy").deliver
                            
                        end

                     

                    if accion.f_seguimiento != 0           
                        times1 = accion.fp_seguimiento.to_time
                        time1 =  times1.to_i - Time.now.to_i
                        m = (time1 / 60 / 60/ 24) + 1
                        accion.tag = false
                        
                        
                        if m <= 0 
                        
                            @accion_seguimiento << accion

                            
                            end
                      end

                      accion.save
                    #end
                    end

        Task.where(estado: false).where(employed_id: empleado.id).order(f_compromiso: :asc).each do |task|
       
           
        times = task.f_compromiso.to_time
        time =  times.to_i - Time.now.to_i
        task.contador_seg = (time / 60 / 60/ 24) + 1
        task.save
        puts task.contador_seg

        if task.contador_seg <= 5 && task.contador_seg >= 0
             task.estado_vencida = false
             task.estado_proxima = false
             task.estado_vigente = true
             @task_alarma_proximo  << task
            
        elsif task.contador_seg < 0
          task.estado_vencida = true
          task.estado_proxima = false
          task.estado_vigente = false          
          @task_alarma_vencido << task

        #elsif task.contador_seg == 0
        else
          task.estado_vencida = false
          task.estado_proxima = false
          task.estado_vigente = true 
          #@accion_alarma_hoy  << accion

        end

                 
      


            
    end 

              AlertaMailer.resumen(empleado, @reports_alarma_vencido,@reports_alarma_proximo,@reports_seguimiento, @accion_alarma_vencido,@accion_alarma_proximo,@accion_seguimiento, @task_alarma_vencido,@task_alarma_proximo).deliver
              puts "holaaaaaaaaaaa"
              puts @reports_alarma_proximo.count
            
            end    
         end   
    end
  end

