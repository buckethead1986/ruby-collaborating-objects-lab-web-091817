class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    found_files = Dir.glob("#{path}/*.mp3") #path is the directory, /*.mp3 gets all files ending in .mp3
    found_files.collect do |file|
      file.gsub("./spec/fixtures/mp3s/", "") #found with binding.pry. same starter for each. gsub replaces first argument with second
    end
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end

  end
end
