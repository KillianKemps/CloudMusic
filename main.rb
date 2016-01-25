require_relative './track.rb'
require_relative './artist.rb'
require_relative './client.rb'
require_relative './view.rb'


class Main
  def self.run
    VIEW.print_welcome

    name = VIEW.ask_for_artist_name

    artist = Artist.find_by_name(name)

    VIEW.display_tracks(artist)

    track_id = VIEW.ask_for_track

    track = Track.new(artist.track(track_id))

    VIEW.download_track(track)
  end
end

Main::run
