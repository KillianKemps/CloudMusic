require 'colorize'

class View
  def print_welcome
    puts "#########################".green
    puts "# Welcome to CloudMusic #".green
    puts "#########################\n".green
  end

  def ask_for_artist_name
    puts "Enter artist name:".white
    name = gets().chomp
    puts "Searching for #{name}...\n\n".white
    return name
  end

  def display_tracks(artist)
    puts "### List of tracks for #{artist.name}: ###\n".green
    tracks = artist.tracks
    puts "There are #{tracks.length} tracks\n".magenta
    tracks.each_with_index do |track, index|
      puts "#{index} - #{track["title"]}".colorize(index%2 == 0 ? :blue : :cyan)
    end
  end

  def ask_for_track
    puts "Please choose a track to download by entering its ID".white
    track_index = gets()
    track_index = track_index.to_i
  end

  def download_track(track)
    puts "Downloading #{track.name}...".white
    track.download!
    puts "\n#{track.name} has been downloaded!".green
  end
end

VIEW = View.new
