module SlackSpotifybot
    module Commands
        class RandomList < SlackRubyBot::Commands::Base
            command 'say_hi' do |client,data, _match|
                client.say(channel: data.channel, text:'Hi! fucker!')
            end
        end
    end
end