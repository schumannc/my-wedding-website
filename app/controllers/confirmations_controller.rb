class ConfirmationsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :email]
  layout proc { false if request.xhr? }
  
  def new
    @confirmation = Confirmation.new
  end

  def index
    @confirmation = Confirmation.all
    @cont = 0
    @confirmation.each do |c|
      @cont+=c.guets
    end
  end
  
  def create
  	@confirmation = Confirmation.new(confirmation_params)
  	@confirmation.ip = request.remote_ip
    status = true
    respond_to do |f|
      if @confirmation.save
        f.html { redirect_to :new}
        f.json { render json: @confirmation, status: :created, location: @confirmation }
    	  UsuarioMailer.confirmado(@confirmation).deliver_now
      else
        status = false
        f.html { render action: "new" }
        f.json { render json: @confirmation.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def edit
    @confirmation = Confirmation.find(params[:id])
  end

  def email
    @confirmation = Confirmation.find_by(confirm_token: params[:id])
    @confirmation.destroy
  end

  def update
    @confirmation = Confirmation.find(params[:id])
      if @confirmation.update_attributes(confirmation_params)
        redirect_to confirmations_url
      else
        render 'edit' 
      end
  end
  
  def destroy
    @confirmation = Confirmation.find(params[:id])
    @confirmation.destroy
    redirect_to confirmations_url
  end

  private
  def confirmation_params
  	params.require(:confirmation).permit(:name, :email, :guets, :phone)
  end
end
