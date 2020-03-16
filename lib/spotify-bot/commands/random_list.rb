module SlackSpotifybot
    module Commands
        class Search < SlackRubyBot::Commands::Base
            command 'say_hi' do |client,data, _match|
                client.say(channel: data.channel, text: "hellow")
            end
            command 'search_artist' do | client,data, _match|
                search = ApiSpotify::Search.new(ENV [SPOTIFY_AUTH_TOKEN])
                result = search.artist(data.channel)
                client.say(channel: data.channel, text: "Check! #{result}" )
            end
        end
    end
end