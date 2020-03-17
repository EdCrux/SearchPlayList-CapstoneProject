module SlackSpotifybot
  module Commands
    class Search < SlackRubyBot::Commands::Base
        
      @@token = ENV['SPOTIFY_API_TOKEN']
      
      command 'say_hi' do |client, data, _match|
        client.say(channel: data.channel, text: 'hi, dear user')
      end
      
      command 'search_artist:' do |client, data, _match|
        search = ApiSpotify::Search.new(@@token)
        d = data.text.split(':')
        result = search.artist(d.last)
        client.say(channel: data.channel, text: "Result of  #{result}")
      end
      
      command 'search_song:' do |client, data, _match|
        search_song = ApiSpotify::Search.new(@@token)
        d = data.text.split(':')
        result = search_song.song(d.last)
        client.say(channel: data.channel, text: "Your song is : #{result}")
      end
    end
  end
end
