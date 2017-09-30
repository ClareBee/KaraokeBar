class Song

  attr_reader :name, :songs #do i need this or is reader enough

  def initialize(name)
    @name = name
    @songs = []
  end

  def new_song_for_bar(new_song_name)
    @songs << new_song_name
  end


end
