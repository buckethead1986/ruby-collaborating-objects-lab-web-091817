class Artist
attr_accessor :name, :songs

@@all = [] #keep track of all artists, ever

  def initialize(name)
    @name = name #initialize with a name
    @songs = [] #need a place to keep an artist instances songs
  end

  def add_song(name) #when a song is made, add it to that artists list of songs
    @songs << name
  end

  def save #method to put the artist instance into the class variable
    @@all << self
  end

  def self.all #required helper method to abstract out @@all
    @@all
  end

  def self.find_or_create_by_name(name) #uses the helper methods below. if (true) ? (do this) : (else, this)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name) #iterates through @@all to find an artist given a name
    @@all.find {|artist| artist.name == name}
  end

  def self.create(name) #makes a new artist instance
    song = self.new(name)
    @@all << song
    song
  end

  def print_songs #iterates through songs list, puts song.nameto console.
    @songs.each {|song| puts song.name}
  end

end
