module ReportsHelper

def cerrar_reporte(nc,correccion,causa,accion,report)

reporte = Report.find(report)

	if correccion 
        
        #verifico si ya se hicieron Correcciones
        contc =  Accion.where(report_id: report).where(tipo: "Correccion").count

            if contc != 0 || nc

                contc1 =  Accion.where(report_id: report).where(tipo: "Correccion").where(estado: "Abierta").count
                if contc1 == 0 
                    
                    estadoc = true

                end
                
            else

            	estadoc= false


            end

        else
            estadoc = true
    end

    if  accion && reporte.accion == "Si"
    
        #verifico si ya se hicieron Acciones
        conta =  Accion.where(report_id: report).where(tipo: "Accion").count

            if conta != 0 || nc

                conta1 =  Accion.where(report_id: report).where(tipo: "Accion").where(estado: "Abierta").count
                if conta1 == 0
                    
                    estadoa = true

                end
                
            else

            	estadoa = false

            end

        else
            
            estadoa = true

    end        

    if causa
        #verifico si ya se hizo el analisis de causas
            contaca =  Causa.where(report_id: report).count

            if contaca != 0 || nc

               
                    
                    estadoca = true

               
                
            else

            	estadoca = false

            end
    else 

    	 estadoca = true


    end






            if estadoc && estadoa && estadoca

                return true
            else
            	return false
            end


  end
   
    




end
