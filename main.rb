require 'colorize'
require_relative './model.rb'

puts "#####################".green
puts "Welcome to CloudMusic!".green
puts "#####################\n".green

puts "Enter artist name:"
name = gets()
puts "Searching for #{name.chomp}...\n\n"
artist = get_artist(name.chomp)

puts "### List of tracks for #{artist["full_name"]}: ###\n"

id = artist["id"]
tracks = get_artist_tracks(id)
puts "There are #{tracks.length} tracks\n\n".magenta
tracks.each_with_index do |track, index|
  puts "#{index} - #{track["title"]}".colorize(index%2 == 0 ? :blue : :cyan)
end
