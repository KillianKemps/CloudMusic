require 'colorize'
require_relative './model.rb'

puts "#########################".green
puts "# Welcome to CloudMusic #".green
puts "#########################\n".green

puts "Enter artist name:".white
name = gets()
puts "Searching for #{name.chomp}...\n\n".white
artist = get_artist(name.chomp)

puts "### List of tracks for #{artist["full_name"]}: ###\n".green

id = artist["id"]
tracks = get_artist_tracks(id)
puts "There are #{tracks.length} tracks\n".magenta
tracks.each_with_index do |track, index|
  puts "#{index} - #{track["title"]}".colorize(index%2 == 0 ? :blue : :cyan)
end

puts "Please choose a track to download by entering its ID".white
track_index = gets()
track_index = track_index.to_i

puts "Downloading #{tracks[track_index]["title"]}...".white
download_track(tracks[track_index]["stream_url"], tracks[track_index]["title"])

puts "\n#{tracks[track_index]["title"]} has been downloaded!".green
