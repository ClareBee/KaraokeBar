require 'minitest/autorun'
require 'minitest/rg'

require_relative '../room'
require_relative '../guest'
require_relative '../song'

class TestRoom < MiniTest::Test

  def setup()
    @room = Room.new(1, 5)
    @guest = Guest.new("Bob", "blip", 10)
    @guest2 = Guest.new("Bill", "bleep", 20)
    @song = Song.new("bloop")
  end

  def test_room_number
    assert_equal(1, @room.check_room_number)
  end

  def test_check_capacity
    assert_equal(5, @room.check_capacity)
  end

  def test_check_guest_names
    @room.add_guest(@guest)
    @room.add_guest(@guest2)
    result = @room.check_guest_names
    assert_equal("Bob, Bill", result)
  end

  def test_add_song
    playlist = []
    #act
    @room.add_song(@song)
    #assert
    assert(@room.playlist.include?(@song))
  end

  def test_add_guest_to_room
    @room.add_guest(@guest)
    result1 = @room.occupancy.length
    result2 = @room.check_capacity
    assert_equal(1, result1)
    assert_equal(4, result2)
  end

  def test_remove_guest_from_room
    @room.remove_guest("Bob")
    refute(@room.occupancy.include?("Bob"))
    assert_equal(5, @room.capacity)
  end

  def test_if_room_has_fav_song
    @room.add_song(@guest.fav_song)
    result = @room.has_song?(@guest.fav_song)
    assert(result)
    assert(@room.playlist.include?("blip"))
  end


end
