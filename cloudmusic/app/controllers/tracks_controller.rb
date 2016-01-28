require "open-uri"

class TracksController < ApplicationController
  def download
    track = MusicFinder.get_track(params["id"])
    url = MusicFinder.download_track(track.stream_url)

    # Makes the browser download the file
    send_data open(url).read,
      :type => "audio/mpeg",
      :disposition => "attachment; filename=\"#{track.title}.mp3\""
  end
end
