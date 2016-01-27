class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def search
    @artists = Artist.where(full_name: params["name"])
  end

  def show
  end
end
