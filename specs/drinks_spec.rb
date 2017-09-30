require 'minitest/autorun'
require 'minitest/rg'

require_relative '../drink'

class TestDrink < MiniTest::Test

  def setup
    @beer = Drink.new("beer", 5)
  end

  def test_drink_name
    assert_equal("beer", @beer.name)
  end

end
