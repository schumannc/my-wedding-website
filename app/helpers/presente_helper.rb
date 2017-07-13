module PresenteHelper

	def presente_titulo(titulo)
		if /[a]$/.match(titulo)
			"Ver presentes para "+ "a " + titulo
		else
			"Ver presentes para "+ "o " + titulo
		end
	end

	def itens_titulo(titulo)
        if /[a]$/.match(titulo)
			"Itens da " + titulo
		else
			"Itens do " + titulo
	    end
	end

	def cotas(total, arrecadado)
		total -= arrecadado
		itens = Array.new
		if total >= 50 
			itens.push item(total, 50)
		end
		if total >= 100
			itens.push  item(total, 100)
		end
		if total >= 200
			itens.push  item(total, 200)
		end
		if total >= 300
			itens.push item(total, 300)
		end
		if total >= 500
			itens.push item(total, 500)
		end
		if total >= 800
			itens.push item(total, 800)
		end
		if total >= 1000
			itens.push item(total, 1000)
		end
		if total >= 1500
			itens.push item(total, 1500)
		end
		if total >= 2000
			itens.push item(total, 2000)
		end

		if !itens.any? {|word| /(100% completar o item)/.match(word.to_s)}
		    itens.push ["R$"+ total.round.to_s + " (100% completar o item)", total]
		end
		return itens.reverse
	end

private

	def item(total, valor)
		if total == valor
		 string = "R$"+ valor.round.to_s + " (100% completar o item)"
		 return [string, valor]
		else
		 percent = valor/total * 100
		 string = "R$" + valor.round.to_s  + "  (" + percent.round.to_s + "%)"
		 return [string, valor]
		end
	end
end
