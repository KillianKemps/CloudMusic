require 'soundcloud'
require_relative './tokens.rb'

CLIENT = SoundCloud.new(TOKENS)

# Display 10 hottest tracks
p CLIENT.get('/tracks', :limit => 10, :order => 'hotness')

