class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def search
    @artists = MusicFinder.find_artist(params["name"])
    return @artists
  end

  def show
  end
end
