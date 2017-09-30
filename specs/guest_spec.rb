require 'minitest/autorun'
require 'minitest/rg'

require_relative '../guest'
require_relative '../drink'

class TestGuest < MiniTest::Test

  def setup()
    @guest = Guest.new("Paul", "blabla", 40)
    @drink = Drink.new("beer", 5)
  end

  def test_check_cash
    assert_equal(40, @guest.cash)
  end

  def test_guest_has_fav_song
    assert_equal("blabla", @guest.check_fav_song)
  end

  def test_buy_drink
    @guest.buy_drink(@drink)
    assert_equal(35, @guest.cash)
  end
end
