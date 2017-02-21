module CausasHelper

	def nivel(causa,nivel)

  cau = Causa.find(causa)
  if nivel == "1"
    cau.primera_m
  elsif nivel = "2"
    cau.seguna_m
    elsif nivel = "3"
    cau.tercera_m
    elsif nivel = "4"
    cau.cuarta_m
    elsif nivel = "5"
    cau.quinta_m
    elsif nivel = "6"
    cau.sexta_m
  end    
  end  
end
