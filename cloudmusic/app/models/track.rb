class Track < ActiveRecord::Base
  belongs_to :artist
  attr_accessor :id, :title, :url

  def initialize(id, title, stream_url)
    @id = id
    @title = title
    @artist_id = artist_id
    @stream_url = stream_url
    @duration = duration
    @artwork_url = artwork_url
  end
end
