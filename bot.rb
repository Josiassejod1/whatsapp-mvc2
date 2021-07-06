require "sinatra/base"
require "../mvc2.rb"
class WhatsAppBot < Sinatra::Base
   # use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/bot'
   CHARACTER = %w{
    Blackheart
    Cable
    Captain America
    Colossus
    Cyclops
    Doctor Doom
    Gambit
    Hulk
    Ice Man
    Iron Man
    Juggernaut
    Magneto
    Marrow
    Omega Red
    Psylocke
    Rogue
    Sabretooth
    Sentinel
    Shuma-Gorath
    Silver Samurai
    Spider-Man
    Spiral
    Storm
    Thanos
    Venom
    War Machine
    Wolverine
    Akuma
    Amingo
    Anakaris
    Baby Bonnie Hood
    Cammy
    Captain Commando
    Charlie
    Chun-Li
    Dan
    Dhalsim
    Felicia
    Guile
    Hayato
    Jill
    Ken
    Vega
    Mega Man
    Morrigan
    Roll
    Ruby Heart
    Ryu
    Sakura
    Servbot
    SonSon
    Strider
    Tron Bonne
    Zangief
}
    get '/' do
        
    end


    post '/bot' do
        body = params["Body"].downcase

        response = Twilio::TwiML::MessagingResponse.new
        found = false
        response.message do |message|
            words = body.split(" ")
            puts words
            words.each do |character|
                if CHARACTER.include?(character.capitalize) 
                    found = true
                    character = MVC2.new(character.capitalize)
                    message.media(character.image)
                    message.body("Character: #{character.name}")
                    message.body("Universe: #{character.universe}")
                    break
                else
                    next
                end
            end

            if (!found)
                message.body("Couldn't find character")
            end 
        end

        content_type "text/xml"
        response.to_xml
    end
end