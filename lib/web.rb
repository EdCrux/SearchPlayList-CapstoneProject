require 'sinatra/base'

module SlackSpotifybot
    class Web < Sinatra::Base
        get '/' do
           'Music is really good for you'
        end
    end
end