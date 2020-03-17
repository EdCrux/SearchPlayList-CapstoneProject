module SlackSpotifybot
    module Commands
        class Search < SlackRubyBot::Commands::Base
            command 'say_hi' do |client,data, _match|
                client.say(channel: data.channel, text: "hellow")
            end
            command 'search_artist' do | client, data, _match|
                token = 'BQC6vE7ME67IcO3Hnle0DpJfp6aDD7Pg2acJCv6fjx1pr_ql9hpRzsZjHXJ8RzKO1MBUEn7SiV8DWEkpPyi1anVSVnvIpC4oRz6UhKZOSj_SmTqBRRM4iFaYkGW5_MTHtHda6FAP0_QhaE3lzymCu9o83hMg9yrDlteVTmOFelHN73V93aFokD8w2CPvmA6THqsMNuOIMpqE44n59XE9Zhp4zmoX4eofSzt9oGtTh6fBuwfl7Sd3XWexVz6damRdF-u9QQvnb_ryOPVs3KBbG_UBJT5I2-Fk-w'

                search = ApiSpotify::Search.new(token)
                d = data.text.split(' ')
                result = search.artist(d.last)
                client.say(channel: data.channel, text: "Command band #{result}" )
            end
        end
    end
end