class KaraokeBar

attr_accessor :name, :entryfee, :rooms
  def initialize(name, entryfee)
    @name = name
    @entryfee = entryfee
    @rooms = []
  end

  def check_name
    return @name
  end

  def charge_guest(guest)
  if @entryfee > guest.cash
   puts "you can't afford to enter"
   exit
  else
   guest.cash -= @entryfee
  end
  return guest.cash
  end



end
