class MusicFinder
  def self.client
    SoundCloud.new({
      client_id: Rails.application.secrets.soundcloud_api_key,
      client_secret: Rails.application.secrets.soundcloud_api_secret
    })
  end

  def self.downloader
    SoundCloud::Downloader::Client.new({
      client_id: Rails.application.secrets.soundcloud_api_key,
      path: "downloads"
    })
  end

  def self.find_artist(name)
    artists = Artist.where("full_name LIKE '%#{name}%'")

    if artists.any?
      return artists
    else
      users = self.client.get('/users', q: name)
      artists = users.map do |user|
        Artist.create({
          full_name: user["username"],
          soundcloud_id: user["id"],
          avatar_url: user["avatar_url"],
          permalink_url: user["permalink_url"],
          track_count: user["track_count"]
        })
      end
      return artists
    end
  end

  def self.get_artist(id)
    Artist.find(id)
  end

  def self.find_tracks(artist)
    if artist.tracks.any?
      artist.tracks 
    else
      tracks = client.get("/users/#{artist.soundcloud_id}/tracks")

      tracks.map do |track|
        artist.tracks.create({
          title: track["title"],
          stream_url: track["stream_url"],
          duration: track["duration"],
          artwork_url: track["artwork_url"],
        })
      end
    end
  end

  def self.get_track(track_id)
    Track.find(track_id)
  end

  def self.download_track(track_stream_url)
    downloader.resolve(track_stream_url)
  end
end
