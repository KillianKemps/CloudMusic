class Artist < ActiveRecord::Base
  has_many :tracks
  attr_accessor :id, :full_name

  def initialize(id, full_name)
    @id = id
    @full_name = full_name
  end
end
