require 'soundcloud'
require 'soundcloud-downloader'
require_relative './tokens.rb'

CLIENT = SoundCloud.new(TOKENS)

def get_artist(name)
  artists = CLIENT.get('/users', q: name)
  return artists.first
end

def get_artist_tracks(artist_id)
  tracks = CLIENT.get("/users/#{artist_id}/tracks")
  return tracks
end

DOWNLOADER = SoundCloud::Downloader::Client.new(DOWNLOADER_CONF)

def download_track(track_stream_url, name)
  DOWNLOADER.download(track_stream_url, { file_name: name, display_progress: true })
end
