class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:test_image]

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

  def test_image
    cloudKey = "f2fe7867ebe7e5926d6aaa36e0478081"
    cloudSecret = "jvmFnUk8BFRkENthhmCQdrocahT1DTZf1cFtCJw80b7LYlWD3iQR2fQyzLs1pc59OjfxUESQcQGyRlVCqsdNsd0oiuWmonJCJHuThKVBx8lX7BiXYLAekSEsj9ZMr9j7"
    cloudUrl = "http://00e7bae37b68f3cf44b5fcff939b79af.na1.crs.easyar.com:8080/search"
    file = params[:image]
    image = Base64.encode64(File.read(file.path))
    parameters = {
      'timestamp' => Time.now.to_i,
      'appKey' => cloudKey,
      'image' => image
    }
    parameters['signature'] = getSign(parameters, cloudSecret)
    uri = URI.parse(cloudUrl)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, {'Content-Type' =>'application/json'})
    request.body = parameters.to_json
    # Send the request
    response = http.request(request)
    binding.pry
    data = JSON.parse(response.body)
  end

  private
  def getSign(parameters, secret)
    string = parameters.sort.map.each do |k,v|
              "#{k}#{v}"
            end
    string = string.join("")+secret
    return Digest::SHA256.hexdigest(string) 
  end
end
