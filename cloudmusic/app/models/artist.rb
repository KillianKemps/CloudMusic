class Artist < ActiveRecord::Base
  has_many :tracks
  attr_accessor :id, :full_name

  def initialize(id, full_name)
    @id = id
    @soundcloud_id = soundcloud_id
    @full_name = full_name
    @avatar_url = avatar_url
    @permalink_url = permalink_url
    @track_count = track_count
  end
end
