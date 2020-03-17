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

            command 'search_artist,'   do
                title 'search'
                desc 'Returns the artist you select'
                long_desc 'Returns the artist related to your search'
            end

            command 'search_song,' do
                title 'search_song'
                desc 'Returns the songs that match with your search'
                long_desc 'Returns the posibles songs'
            end
        end
    end
end