class MusicFinder
  def self.client
    SoundCloud.new({
      client_id: Rails.application.secrets.soundcloud_api_key,
      client_secret: Rails.application.secrets.soundcloud_api_secret
    })
  end

  def self.find_artist(name)
    artists = Artist.where("full_name LIKE '%#{name}%'")

    if artists.any?
      return artists
    else
      artists = self.client.get('/users', q: name)
      artists.each do |artist|
        artist["full_name"] = artist["full_name"] == '' ? artist["username"] : artist["full_name"]
      end
      return artists
    end
  end
end
