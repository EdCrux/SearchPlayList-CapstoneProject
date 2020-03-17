require 'vcr'
require './lib/spotify-bot/api_spotify/search'
require 'yaml'

VCR.configure do |config|
  config.cassette_library_dir = File.join(File.dirname(__FILE__), 'support')
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

describe SlackSpotifybot::ApiSpotify::Search do
  let(:artist) { 'dream theater' }
  let(:song) { 'pull me under' }
  let(:search) { SlackSpotifybot::ApiSpotify::Search.new(ENV['SPOTIFY_API_TOKEN']) }

  let(:user_response_artist) do
    VCR.use_cassette('spotify2') { search.get_http(artist, 'artist') }
  end

  let(:user_response_song) do
    VCR.use_cassette('spotify') { search.get_http(song, 'track') }
  end

  describe '#transform_name' do
    it 'Returns the artist name replacing the empty spaces with %' do
      expect(search.transform_name(artist)).to eql('dream%theater')
    end
    it 'Returns the song name repalceing the empty space with %' do
      expect(search.transform_name(song)).to eql('pull%me%under')
    end
  end

  describe '#get_http' do
    it 'Can fetch and parse song' do
      expect(user_response_song).to be_kind_of(Hash)
      expect(user_response_song).to have_key('tracks')
    end
    it 'Can fetch and parse artist' do
      expect(user_response_artist).to be_kind_of(Hash)
      expect(user_response_artist).to have_key('artists')
    end
  end
end
