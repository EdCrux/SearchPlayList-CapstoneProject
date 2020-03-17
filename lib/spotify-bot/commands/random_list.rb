module SlackSpotifybot
  module Commands
    class Search < SlackRubyBot::Commands::Base
      token = 'BQDJeG2jiPco6wihplV84EwkZXLO20IjIGjCnsP93tkcJqOh8PEJwrSBCYNCkQfdvjU7XoD-d9MwqdfZQSeAPOiqQXyYhytcNJrJcef5LgwPbWna8UI649MgOwO1Pk30RVwHjeZooUofoA6qkVu6IREduA72dBJ_Q7EMsAdNzmTOlEBnerQ9DWZ7PeSDS2KDePGhBzoY3Zp28MZ_OsHTViCcf5rl4kMWCdcUF_q4K1AAANYSKDbBW3IEcwur8S9qGQp6J9CWIJcXfSw5TZHrcxxPr2CC0ORaNw'
      search = ApiSpotify::Search.new(token)

      command 'say_hi' do |client, data, _match|
        client.say(channel: data.channel, text: 'hellow')
      end

      command 'search_artist,' do |client, data, _match|
        d = data.text.split(':')
        result = search.artist(d.last)
        client.say(channel: data.channel, text: "Result of  #{result}")
      end

      command 'search_song,' do |client, data, _match|
        d = data.text.split(':')
        result = search.artist(d.last)
        client.say(channel: data.channel, text: "Your song is #{result[0]}")
      end
    end
  end
end
