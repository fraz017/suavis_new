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
    send_file("#{Rails.root}/public/pps.plist", filename: "pps.plist")
  end

  def ipa
    send_file("#{Rails.root}/public/pps.ipa", filename: "pps.ipa")
  end

  def test
  end

  def testpps
    send_file("#{Rails.root}/public/test.plist", filename: "test.plist")
  end

  def testipa
    send_file("#{Rails.root}/public/test.ipa", filename: "test.ipa")
  end
end
