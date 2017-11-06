class WelcomeController < ApplicationController
  def index
  end

  def contact
  	if verify_recaptcha
  		ContactMailer.send_email(params[:name], params[:email], params[:message]).deliver_later	
    end	
    render json: {success: true}, status: 200
  end
end
