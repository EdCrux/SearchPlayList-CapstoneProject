require 'json'
require 'open-uri'
require 'http'

module SlackSpotifybot
    module ApiSpotify
        class Search
            attr_accessor :your_id

            def initialize(your_id)
                self.your_id = your_id
            end

            def artist(name)
                response = get_http(name,'artist')
                response
            end

            def song(name)
                response = get_http(name,'track')
                response
            end
            
            def transform_name(name)
                n = name.split('')
                n.map { |l| l.replace('%') if l == ' ' }
                n.join('')
            end

            def get_http(name,type)
                transform_name(name)
                rc = HTTP.get('https://api.spotify.com/v1/search', params:{
                    q:name,
                    type:type,
                  },
                  headers:{
                      Authorization:" Bearer #{self.your_id}"
                })
                response = JSON.parse(rc.body)
                response
            end
        end
    end
end