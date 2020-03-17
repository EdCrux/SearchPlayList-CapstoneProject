module SlackSpotifybot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Mercury Spotify searcher'
      desc 'This bot searches by song and by artist into Spotify'

      command :say_hi do
        title 'say_hi'
        desc 'Returns hi'
        long_desc 'Say hi!'
      end

      command 'search_artist:' do
        title 'search_artist: <artistname>'
        desc 'Returns the artist you select'
        long_desc 'Returns the artist related to your search. Remember to use the : then space and then the name of the artist'
      end

      command 'search_song:' do
        title 'search_song: <songname>'
        desc 'Returns the songs that match with your search'
        long_desc 'Returns the posibles songs that you type. Remember to use the : then space and then the name of the song'
      end
    end
  end
end
