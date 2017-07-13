class UsuarioMailer < ApplicationMailer
skip_before_action :authorize
def mensagem_recebida(user)
	attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
	@user = user
	mail to: user.email, subject: "Casamento Pam e Henrique - Mensagem Recebida"
end

def mensagem_publicada(user)
	attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
	@user = user
	mail to: user.email, subject: "Casamento Pam e Henrique - Mensagem Publicada"
end

def confirmado(user)
    attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
	@user = user
	mail to: user.email, subject: "Casamento Pam e Henrique - Presença Confirmada"
end
end
