module SlackSpotifybot
    module Commands
        class RandomList < SlackRubyBot::Commands::Base
            command 'song' do |client,data, _match|
                client.say(channel: data.channel, text:'Choose a song')
            end
        end
    end
end