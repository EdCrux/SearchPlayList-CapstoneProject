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
        response = get_http(name, 'artist')
        arr = []
        arr << response['artists']['items'][0]['name']
        arr << response['artists']['items'][0]['external_urls']['spotify']
        arr << response['artists']['items'][0]['images'][1]['url']
        arr
      end

      def song(name)
        temp_arr = []
        response = get_http(name, 'track')
        response['tracks']['items'].each do |item|
          temp_arr << item['name']
          temp_arr << item['external_urls']['spotify']
        end
        temp_arr
      end
    
      def transform_name(name)
        n = name.split('')
        n.map { |l| l.replace('%') if l == ' ' }
        n.join('')
      end

      def get_http(name, type)
        transform_name(name)
        rc = HTTP.get('https://api.spotify.com/v1/search', params: {
                        q: name,
                        type: type,
                        limit: '5'
                      },
                                                           headers: {
                                                             Authorization: " Bearer #{your_id}"
                                                           })
        response = JSON.parse(rc.body)
        response
      end
    end
  end
end
