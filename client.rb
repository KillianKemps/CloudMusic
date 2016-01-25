require 'soundcloud'
require 'soundcloud-downloader'
require_relative './tokens.rb'

class Client
  def initialize
    @soundcloud_client = SoundCloud.new(TOKENS)
    @soundcloud_downloader_client = SoundCloud::Downloader::Client.new(DOWNLOADER_CONF)
  end

  def get_artist(name)
    @soundcloud_client.get('/users', q: name)
  end

  def get_tracks(artist_id)
    @soundcloud_client.get("/users/#{artist_id}/tracks")
  end

  def download_track(track_stream_url, name)
    @soundcloud_downloader_client.download(track_stream_url, { file_name: name, display_progress: true })
  end
end

CLIENT = Client.new
