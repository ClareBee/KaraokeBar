require 'minitest/autorun'
require 'minitest/rg'

require_relative '../song'

class TestSong < MiniTest::Test

  def setup()
    @song = Song.new("blabla")
  end

  def test_song_has_name()
    assert_equal("blabla", @song.name)
  end

end
