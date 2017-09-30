class Room

attr_accessor :room_number, :capacity, :playlist, :occupancy

  def initialize(room_number, capacity)
    @room_number = room_number
    @capacity = capacity
    @occupancy = []
    @playlist = []
  end

  def check_room_number
    return @room_number
  end

  def check_capacity
    return @capacity - @occupancy.length
  end

  def check_occupancy
    return @occupancy.length
  end

  def check_guest_names
    guest_names = []
    @occupancy.each do |guest|
      guest_names << guest.name
    end
    return guest_names.join(", ")
  end

  def add_song(song_name)
    @playlist << song_name
  end


  def add_guest(guest)
    if @capacity >= @occupancy.length
      @occupancy << guest
    end
    return @occupancy.length
  end

  def remove_guest(guest)
    if @occupancy.include?(guest)
      guest_to_delete = @occupancy.find_index(guest)
      @occupancy.delete_at(guest_to_delete)
    end
    return (@capacity - @occupancy.length)
  end

  def has_song?(fav_song)
    playlist.include?(fav_song)
  end

end
