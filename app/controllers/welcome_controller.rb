class WelcomeController < ApplicationController
  def index
  end

  def contact
  	if verify_recaptcha
  		ContactMailer.send_email(params[:name], params[:email], params[:message]).deliver_later	
    end	
    render json: {success: true}, status: 200
  end

  def manifest
  end

  def pps
    send_file("#{Rails.root}/public/manifest.plist", filename: "manifest.plist")
  end

  def ipa
    send_file("#{Rails.root}/public/PPS Sales.ipa", filename: "PPS Sales.ipa")
  end
end
