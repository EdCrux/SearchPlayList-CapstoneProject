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
      end

      command 'search_song:' do
        title 'search_song: <songname>'
        desc 'Returns the songs that match with your search'
      end
    end
  end
end
