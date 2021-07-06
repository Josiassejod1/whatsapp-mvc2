require "sinatra/base"

class WhatsAppBot < Sinatra::Base
   # use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/bot'
    get '/' do
        
    end


    post '/bot' do
        body = params["Body"].downcase
        puts "THIS TEST WORK"
        response = Twilio::TwiML::MessagingResponse.new
        response.message do |message|
            if body.include?("dog")
                message.body("I love dogs")
            end
            if body.include?("cat")
                message.body("I love cats")
            end
            puts "THIS DONT WORK"
            if !body.include?("dog") ||  body.include?("cat")
                message.body("I only know about dogs or cats, sorry!")
            end
        end

        content_type "text/xml"
        response.to_xml
    end
end