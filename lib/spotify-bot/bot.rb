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

            command :search_artist do
                title 'Search any artist from Spotify'
                desc 'Returns the results that you search'
                long_desc 'Returns the artist related to your search'
            end
        end
    end
end