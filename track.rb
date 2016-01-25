class Track
  attr_reader :name

  def initialize(data)
    @stream_url = data["stream_url"]
    @name = data["title"]
  end

  def download!
    CLIENT.download_track(@stream_url, @name)
  end
end
