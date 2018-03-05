module AccionsHelper

	def f_seguimiento(fecha)

		case fecha
            when 0
            return 'N/A'
            when 1
            return 'Diario'
            when 7
            return 'Semanal'
            when 15
            return 'Quincenal'
            when 30
            return 'Mensual'
            when 90
            return 'trimestral'
            when 182
            return 'Semestral'  
            else
            return 'Anual'
        end
                        

	    end


    

end
