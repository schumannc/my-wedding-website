class PresentesController < ApplicationController
skip_before_action :authorize
	def index
		@item = Presente.all.sort_by{|presente| presente.arrecadado / presente.total}
		#temporary bug fix
		@item.each do |presente|
			has_all_itens_complete = true
			presente.line_items.each do |item|
				porcentage =  item.arrecadado / item.valor
			  has_all_itens_complete = false if porcentage < 1
			end
			presente.arrecadado = presente.total if has_all_itens_complete
		end
	end
	def show
		@item = Presente.find_by(url: params[:url])
		@line_items = @item.line_items.all.sort_by{|item| item.arrecadado / item.valor}
	end
	def listas
	end
end
