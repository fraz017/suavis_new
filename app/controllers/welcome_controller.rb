class WelcomeController < ApplicationController
  def index
  end

  def contact
  	ContactMailer.send_email(params[:name], params[:email], params[:message]).deliver_later
    render json: {success: true}, status: 200
  end
end
