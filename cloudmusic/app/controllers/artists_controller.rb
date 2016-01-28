class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def search
    @artists = MusicFinder.find_artist(params["name"])
    return @artists
  end

  def show
    @artist = MusicFinder.get_artist(params["id"])
    @tracks = MusicFinder.find_tracks(@artist)
  end
end
