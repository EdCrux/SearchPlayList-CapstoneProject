require 'json'
require 'open-uri'

module SlackSpotifybot
    module ApiSpotify
        class Search
            attr_accessor :your_id

            def initialize(your_id)
                @your_id = your_id
            end

            def artist(name)
                name.transform_name
                rc = HTTP.get('https://api.spotify.com/v1/search', params:{
                    q:name,
                    type:'track,artist'
                },
                headers:{
                    Authorizatiion:"#{Bearer @your_id}"
                })
                response = JSON.parse(rc.body)
                return response['artist']['items'][0]["name"],response['artists']['items'][0]['images'][1]['url'],response['items'][0]['external_urls']['spotify']    
            end

            def song(name)
                #search for a song 
            end

            def transform_name
                if valide(name)
                  arr = split('')
                  arr.map { |l| l.replace('%') if l == ' ' }
                  arr.join('')
                end
            end
        end
    end
end