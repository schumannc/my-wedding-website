class SessionsController < ApplicationController
skip_before_action :authorize, only: [:new, :create, :destroy]

  def new
  end

  def index
    @mensagens = Message.all
  end

  def confirmados
  end

  def arrecadado
  end
  
  def create
  	user = Admin.find_by(user: params[:session][:user].downcase)
  	if user && user.authenticate(params[:session][:password])
       log_in user
       redirect_to login_admin_url
  	else
  	   render "new"
  	end
  end
  def destroy
  	log_out
    redirect_to root_url
  end
end
