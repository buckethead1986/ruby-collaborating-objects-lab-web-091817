class Song
attr_accessor :name, :artist


  def initialize(name)
    @name = name

  end

  def self.new_by_filename(filename)
      split_file = filename.split(" - ")
      song = self.new(split_file[1]) #the song name will be the second element in the split)file array. artist name, first. binding.pry to find out.
      song.artist = Artist.find_or_create_by_name(split_file[0])
      song.artist.add_song(self) #self in this case is the instance of Song, not the class, because of the song.artist at the front.
      song
  end
end
