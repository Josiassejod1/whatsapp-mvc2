class MVC2
    def initialize(name)
        response = find_character(name)
        puts response
        puts JSON.parse(response)
        @json_response =  JSON.parse(response.to_s).first
    end

    def name
        @json_response["name"] || ""
    end

    def image
        @json_response["head_shot"] || ""
    end

    def universe
        @json_response["universe"] || ""
    end


    def find_character(name)
        HTTP.get("https://secure-hamlet-19722.herokuapp.com/api/v1/characters/#{name}")
    end
end