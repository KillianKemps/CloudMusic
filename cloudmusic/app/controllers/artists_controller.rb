class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def search
    if params["name"]
      @artists = MusicFinder.find_artist(params["name"])
      return @artists
    else
      @artists = []
    end
  end

  def show
    @artist = MusicFinder.get_artist(params["id"])
    @tracks = MusicFinder.find_tracks(@artist)
  end
end
