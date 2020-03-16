module SlackSpotifybot
    module Commands
        class RandomList < SlackRubyBot::Commands::Base
            command 'say_hi' do |client,data, _match|
                client.say(channel: data.channel, text:)
            end
        end

        class UserList < SlackRubyBot::Commands::Base
            command 'get_player_list' do |client,data,_match|
                client.say()
            end
        end
    end
end