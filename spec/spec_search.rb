require 'vcr'
require './lib/spotify-bot/api_spotify/search'
require 'yaml'
require 'json'

VCR.configure do |config|
  config.cassette_library_dir = File.join(File.dirname(__FILE__), 'support')
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

describe SlackSpotifybot::ApiSpotify::Search do
  let(:artist) { 'dream%theater' }
  let(:song) { 'pull%me%under' }
  let(:search) { SlackSpotifybot::ApiSpotify::Search.new(ENV['SPOTIFY_API_TOKEN']) }
  let(:user_response_song) do
    VCR.use_cassette('tracks') { search.get_http(song, 'track') }
  end
  let(:user_response_artist) do
    VCR.use_cassette('artists') { search.get_http(artist, 'artist') }
  end
  let(:response_tracks) do
    YAML.safe_load(File.open(File.join(File.dirname(__FILE__), '/support/tracks.yml')))
  end
  let(:parser_tracks) { JSON.parse(response_tracks['http_interactions'][0]['response']['body']['string']) }
  let(:response_artist) do
    YAML.safe_load(File.open(File.join(File.dirname(__FILE__), '/support/artists.yml')))
  end
  let(:parser_artist) { JSON.parse(response_artist['http_interactions'][0]['response']['body']['string']) }

  let(:correct_response_tracks) do
    ['Pull Me Under', 'https://open.spotify.com/track/5CPXR6lDTvngxtmMZxnWmC',
     'Pull Me Under', 'https://open.spotify.com/track/1s7EIVMVF4ANXFT26exE1A',
     'Pull Me Under - 2007 Remix',
     'https://open.spotify.com/track/7BrDCCqiUPhRrdqA1ZNasS',
     'Pull Me Under - Live at Budokan Hall, Tokyo, Japan, 4/26/2004',
     'https://open.spotify.com/track/5Kce3r3OQsyo4QwIN8QpFY',
     'Pull Me Under',
     'https://open.spotify.com/track/6MIPI4tSQtvWpzY7z3q4cz']
  end
  let(:correct_response_artists) do
    ['Dream Theater',
     'https://open.spotify.com/artist/2aaLAng2L2aWD2FClzwiep',
     'https://i.scdn.co/image/4dd1dfaf7eb5d9140d92ebd9e087a98513a2ce71']
  end

  describe '#artist' do
    context 'Mock the http response for artist' do
      before do
        allow(search).to receive(:get_http).with(artist, 'artist').and_return(parser_artist)
      end

      it 'Returns an array ' do
        expect(search.artist(artist).class).to be(Array)
      end

      it 'Returns the correct content of the response' do
        expect(search.artist(artist)).to match_array(correct_response_artists)
      end
    end
  end

  describe '#song' do
    context 'Mock the http response for songs' do
      before do
        allow(search).to receive(:get_http).with(song, 'track').and_return(parser_tracks)
      end

      it 'Returns an array' do
        expect(search.song(song).class).to be(Array)
      end

      it 'Returns the correct content of the response' do
        expect(search.song(song)).to match_array(correct_response_tracks)
      end
    end
  end
end
