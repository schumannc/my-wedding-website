class CheckoutController < ApplicationController
skip_before_action :authorize, only: [:index, :create, :sucesso, :falha]
	def index
		@item = Presente.find_by(url: params[:presente_url])
		@line_item = @item.line_items.find(params[:line_item_id])
		@order = @line_item.orders.new
	end

	def sucesso
		@order = Order.find(params[:external_reference])
		@item = Presente.find(@order.presente_id)
		if !@order.sucesso && !@order.pagseguro
			@line_item = LineItem.find(@order.line_item_id)
			@item.arrecadado += @order.amount
			@line_item.arrecadado += @order.amount
			@item.save
			@line_item.save
			@order.sucesso = true
			@order.save
		end
	end

	def falha
		@order = Order.find(params[:external_reference])
		@item = Presente.find(@order.presente_id)
		if @order.sucesso && !@order.pagseguro
			@line_item = LineItem.find(@order.line_item_id)
			@item.arrecadado -= @order.amount
			@line_item.arrecadado -= @order.amount
			@item.save
			@line_item.save
			@order.sucesso = false
			@order.save
		end
	end

	def create
    @order = Order.new(order_params)

    if @order.save
				# Deactivate mercadopago service & pagseguro
				# redirecting to root
	    	# response = mercadopago(@order)
				redirect_to root_path, status: 301

		# 		if response['status'] != "201"
		# 			flash[:error] = "Erro na conexão. Tente mais tarde."
		# 			render :index
		# 			raise response.errors.join("\n")
		# 		else
		# 			@order.url = response['response']['init_point']
		# 			@order.save
		# 			redirect_to response['response']['init_point']
		# 		end
		else
		 	redirect_to action: :index
		end

  end

  def show
    @orders = Order.order(created_at: :desc)
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
	@order = Order.find(params[:id])
	    if @order.update_attributes(order_params)
	    	@line_item = LineItem.find(@order.line_item_id)
				@item = Presente.find(@order.presente_id)
			if !@order.sucesso
				@item.arrecadado -= @order.amount
				@line_item.arrecadado -= @order.amount
				@item.save
				@line_item.save
			else
				@item.arrecadado += @order.amount
				@line_item.arrecadado += @order.amount
				@item.save
				@line_item.save
			end
	      redirect_to arrecadado_path
	    else
	      render 'edit'
	    end
	end

  def destroy
  	@order = Order.find(params[:id])
  	@order.destroy
  	redirect_to arrecadado_path
  end

private
 def order_params
 	params.require(:order).permit(:name, :email, :amount, :presente_id, :line_item_id, :mensagem, :description, :sucesso, :pagseguro)
 end

 def pagseguro(order)
	payment = PagSeguro::PaymentRequest.new

	payment.reference = order.id
	payment.notification_url = notifications_url
	payment.redirect_url = sucesso_url(order.id)

	payment.items << {
	id: order.id,
	description: order.description,
	amount: order.amount
	}

	payment.sender = {
	email: order.email,
	}

    payment.shipping = {
    type_name: "not_specified",
    address: {
		street: 'Mauricio Cardozo',
		number: 55,
		complement: 'Ap 22 Bloco N',
		city: 'São José dos Campos',
		state: 'SP',
		district: 'Jardim Sul',
		postal_code: '12236495',
	}
	}
	payment.register
 end


 def mercadopago(order)
 	require 'mercadopago.rb'
 	mp = MercadoPago.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
 	line_item = LineItem.find(order.line_item_id)
  presente = Presente.find(order.presente_id)

    preference_data = {
      items: [
        {
          id: line_item.id,
          title: order.description,
          description: "Item - #{presente.item}",
          picture_url: ActionController::Base.helpers.image_url(line_item.image_url),
          quantity: 1,
          unit_price: order.amount.to_f.round(1),
          currency_id: "BRL"
        },
      ],
      payer: {
      	email: order.email
      },
      external_reference: order.id,
      back_urls: {
    		success: sucesso_url,
    		pending: sucesso_url,
    		failure: falha_url
      }
    }

    mp.create_preference(preference_data)

 end
end
