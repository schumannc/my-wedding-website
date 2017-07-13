class NotificationsController < ApplicationController
skip_before_action :authorize
protect_from_forgery with: :null_session
skip_before_filter :verify_authenticity_token, only: :create

	def off
		 transaction = PagSeguro::Transaction.find_by_notification_code(params[:notificationCode])

	    if transaction.errors.empty?
	      puts "sem erros"
	      # Processa a notificação. A melhor maneira de se fazer isso é realizar
	      # o processamento em background. Uma boa alternativa para isso é a
	      # biblioteca Sidekiq.
	      if  (1..4) === transaction.status.id.to_i
	      	puts "Aguardando pagamento/Em análise/Paga/Disponível"
	      	puts "reference: " + transaction.reference.to_s
	      	@order = Order.find(transaction.reference)
	      	@order.pagseguro = true
	      	puts "pagseguro:" + @order.pagseguro.to_s
			if !@order.sucesso
				@line_item = LineItem.find(@order.line_item_id)
				@item = Presente.find(@order.presente_id)
				puts @item.item
				puts @line_item.item
				puts "arrecadado antes:" + @line_item.arrecadado.to_s
				puts "order amount: " + @order.amount.to_s
				@item.arrecadado += @order.amount
				@line_item.arrecadado += @order.amount
				puts "arrecadado depois:" + @line_item.arrecadado.to_s
				@item.save
				@line_item.save
				@order.sucesso = true
				puts "sucesso:" + @order.sucesso.to_s
			end
			@order.save
	      end
	      if (5..9) === transaction.status.id.to_i
	      	puts "Em disputa/Devolvida/Cancelada/Chargeback debitado/Em contestação"
	      	puts "reference: " + transaction.reference.to_s
	      	@order = Order.find(transaction.reference)
	      	@order.pagseguro = true
	      	puts "pagseguro:" + @order.pagseguro.to_s
			if @order.sucesso
				@line_item = LineItem.find(@order.line_item_id)
				@item = Presente.find(@order.presente_id)
				puts @item.item
				puts @line_item.item
				puts "arrecadado antes:" + @line_item.arrecadado.to_s
				puts "order amount: " + @order.amount.to_s
				@item.arrecadado -= @order.amount
				@line_item.arrecadado -= @order.amount
				puts "arrecadado depois:" + @line_item.arrecadado.to_s
				@item.save
				@line_item.save
				@order.sucesso = false
				puts "sucesso:" + @order.sucesso.to_s
			end
			@order.save
	      end
	    end	
	   render nothing: true, status: 200
	end


	def create
		require 'mercadopago.rb'
 		mp = MercadoPago.new('8318300787814481', 'd3d7WX0NO8uhyJlGxTqEmisoxXMqdWMF')
 		puts mp.inspect

 		payment_info = mp.get_payment_info(params[:id])
        order_id = payment_info["response"]["collection"]["external_reference"]
        puts "order_id:" + order_id.to_s
        status = payment_info["response"]["collection"]["status"]

        if  test_transaction(status) == "OK"
	      	puts "(pending)|(approved)|(in_process)|(in_mediation)"
	      	puts payment_info.inspect
	      	puts order_id.to_i
	      	@order = Order.find(order_id.to_i)
	      	@order.pagseguro = true
	      	puts "mercadopago:" + @order.pagseguro.to_s
			if !@order.sucesso
				@line_item = LineItem.find(@order.line_item_id)
				@item = Presente.find(@order.presente_id)
				puts @item.item
				puts @line_item.item
				puts "arrecadado antes:" + @line_item.arrecadado.to_s
				puts "order amount: " + @order.amount.to_s
				@item.arrecadado += @order.amount
				@line_item.arrecadado += @order.amount
				puts "arrecadado depois:" + @line_item.arrecadado.to_s
				@item.save
				@line_item.save
				@order.sucesso = true
				puts "sucesso:" + @order.sucesso.to_s
			end
			@order.save
	    end
	    if test_transaction(status) == "NOK"
	      	puts "(rejected)|(cancelled)|(refunded)|(charged_back)"
	      	puts payment_info.inspect
	      	@order = Order.find(order_id.to_i)
	      	@order.pagseguro = true
	      	puts "mercadopago:" + @order.pagseguro.to_s
			if @order.sucesso
				@line_item = LineItem.find(@order.line_item_id)
				@item = Presente.find(@order.presente_id)
				puts @item.item
				puts @line_item.item
				puts "arrecadado antes:" + @line_item.arrecadado.to_s
				puts "order amount: " + @order.amount.to_s
				@item.arrecadado -= @order.amount
				@line_item.arrecadado -= @order.amount
				puts "arrecadado depois:" + @line_item.arrecadado.to_s
				@item.save
				@line_item.save
				@order.sucesso = false
				puts "sucesso:" + @order.sucesso.to_s
			end
			@order.save
	    end
        render nothing: true, status: 200
        puts "Mercado Pago"
        puts order_id.inspect
        puts payment_info.inspect

	end
private
	def test_transaction(status)
		status_ok= /(pending)|(approved)|(in_process)|(in_mediation)/
		status_nok = /(rejected)|(cancelled)|(refunded)|(charged_back)/

		if status_ok =~ status
			"OK"
		elsif status_nok =~ status
			"NOK"
		else
			"status not found"
		end

	end
end
