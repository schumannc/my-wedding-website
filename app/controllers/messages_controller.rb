class MessagesController < ApplicationController
skip_before_action :authorize, only: [:new, :create,:mais]

	def new
		@mensagem = Message.new
	end
	def destroy
		@mensagem = Message.find(params[:id])
		@mensagem.destroy
		redirect_to login_admin_url
	end
	def mais
		@mensagem = Message.get_all
		respond_to do |f|
			f.js
		end
	end
	def confirmar
		@mensagem = Message.find(params[:id])
		@mensagem.confirmation = true
		@mensagem.save
		redirect_to login_admin_url
		UsuarioMailer.mensagem_publicada(@mensagem).deliver_now
	end
	def create
	@mensagem = Message.new(mensagem_params)
	status = true
		respond_to do |f|
			if @mensagem.save
			  f.json { render json: @mensagem, status: :created }
			  #UsuarioMailer.mensagem_publicada(@mensagem).deliver_later!(wait: 10.seconds)
			  UsuarioMailer.mensagem_recebida(@mensagem).deliver_now
			else
			  f.json { render json: @mensagem.errors, status: :unprocessable_entity }
			  status = false
			end
		end
	end
	def edit
		@mensagem = Message.find(params[:id])
	end
	def update
		@mensagem = Message.find(params[:id])
	    if @mensagem.update_attributes(mensagem_params)
	      redirect_to login_admin_url
	    else
	      render 'edit'
	    end
	end
private
	def mensagem_params
		params.require(:message).permit(:name, :email, :text, :confirmation)
	end
end
