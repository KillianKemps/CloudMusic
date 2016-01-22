require 'soundcloud'
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

