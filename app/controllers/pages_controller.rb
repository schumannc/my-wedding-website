class PagesController < ApplicationController
skip_before_action :authorize
skip_before_filter :verify_authenticity_token, only: :instagram
  def home
  	@mensagem = Message.new
  	@display_mensagem = Message.first_four
  end
  def fotos
  end	
  def instagram
  end
  def locais
  end
end
