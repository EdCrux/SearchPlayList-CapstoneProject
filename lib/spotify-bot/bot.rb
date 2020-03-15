module SlackSpotifybot
    class Bot < SlackRubyBot::Bot
        help do
            title 'Spotify Random Song'
            desc 'This bot generates a Random play list'

            command :say_hi do
                title 'say_hi'
                desc 'Returns hi'
                long_desc 'Returns hi'
            end
        end
    end
end