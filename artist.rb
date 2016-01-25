class Artist
  attr_reader :name

  def initialize(data)
    @id = data["id"]
    @name = data["full_name"]
    @tracks = []
  end

  def self.find_by_name(name)
    artists = CLIENT.get_artist(name)
    artist = artists.first
    new(artist)
  end

  def tracks
    @tracks = CLIENT.get_tracks(@id)
    @tracks
  end

  def track(id)
    @tracks[id]
  end
end
