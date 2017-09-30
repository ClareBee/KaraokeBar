require 'minitest/autorun'
require 'minitest/rg'

require_relative '../karaoke_bar'
require_relative '../room'
require_relative '../song'
require_relative '../guest'

class TestKaraokeBar < MiniTest::Test

  def setup()
    @bar = KaraokeBar.new("CCC", 10)
    @guest = Guest.new("Jo", "boop", 50)
  end

  def test_bar_has_name
    assert_equal("CCC", @bar.name)
  end

  def test_entry_fee
    assert_equal(10, @bar.entryfee)
  end

  def test_charge_guest
    @bar.charge_guest(@guest)
    assert_equal(40, @guest.cash)
  end


end

# playlist
# def test_new_song_for_bar()
#   @song.new_song_for_bar("bloo bloo")
#   result =
#   assert_equal(true, result )
#
#
#   def new_song_for_bar(new_song_name)
#     @songs << new_song_name
#
#   end
