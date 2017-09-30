class Guest

attr_reader :name, :fav_song
attr_accessor :cash

  def initialize(name, favourite_song, cash)
    @name = name
    @fav_song = favourite_song
    @cash = cash
  end

  def check_fav_song
    return @fav_song
  end

  def check_how_much_cash
    return @cash
  end


  def buy_drink(drink)
    if @cash >= drink.price
     @cash -= drink.price
    else
    puts "sorry you can't afford that"
    end
  end


end
