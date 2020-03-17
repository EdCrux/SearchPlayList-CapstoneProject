module SlackSpotifybot
    module Commands
        class Search < SlackRubyBot::Commands::Base
            token = 'BQD096WWBK_b-YVwvdfi9f3ink-Gn--5_umMBUUikiS_pRFV8MrYDRxoHqsgBjsxKIPR7gstqC97uS7WHgEzb_fdNYwd2_DmE0L9O_OlDquhmvHg7gHXKtfHD3mT-CC3Hbt2qwtQ3ZzoRUUmzfqeqkqBmBQl3orhRuwsTyWNdX2HbMZHu1KJ-eG0MBSlKe_OQxIpRCSUuO4p3l8zV1Udb1qgiv8yWCQBI8eJfBfYp-XPa0Fm577cHXurTUKt9-r3NxIf6f10qMuFEei0RRsWk8DafRAoe0mhGQ'
            
            command 'say_hi' do |client,data, _match|
                client.say(channel: data.channel, text: "hellow")
            end

            command 'search_artist,' do | client, data, _match|

                search = ApiSpotify::Search.new(token)
                d = data.text.split(',')
                result = search.artist(d.last)
                client.say(channel: data.channel, text: "Result of  #{result.to_s}" )
            end

            command 'search_song,' do |client, data, _match|
                search_song = ApiSpotify::Search.new(token)
                d = data.text.split(',')
                result = search.artist(d.last)
                client.say(channel: data.channel, text: "Your song is #{result[0]}")
            end
        end
    end
end