
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'bin/main'
require 'lib/web'

Thread.abort_on_exception = true

Thread.new do
    begin 
        SlackSpotifybot::Bot.run
    rescue Exception => e
        STDERR.puts "ERROR: #{e}"
        STDERR.puts e.backtrace
        raise e
    end
end

run SlackSpotifybot::Web
    
        