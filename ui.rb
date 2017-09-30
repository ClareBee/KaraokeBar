
class UI
  attr_accessor :new_song, :your_cash, :new_song2, :name, :your_fav_song
  # attr_reader :name, :your_fav_song


  def welcome(bar)
    puts
    puts "============================================================="
    puts "\u{1F3A4  1F3B6}  Welcome to #{bar.name}, the greatest Karaoke Bar ever! \u{1F3B6  1F3A4}"
    puts "============================================================="
  end

  def get_name()
    puts
    puts "What's your name?"
    @name = gets.chomp.capitalize!
    puts "Hello, #{@name}."
    puts
    puts
    puts ">>>>>> Whenever you see these arrows, press ENTER to continue."
    gets.chomp
  end

  def get_budget(bar)
    puts "What's your budget for tonight?"
    @your_cash = gets.chomp.to_i
    puts "Cost of entry is £#{bar.entryfee}."
    if @your_cash < bar.entryfee
      puts "Sorry, you can't afford this"
      exit
    else
    @your_cash = @your_cash - bar.entryfee
    puts "Here's your ticket. You now have £#{@your_cash} left."
    puts
    puts "============================================================="
    puts ">>>>>>"
    gets.chomp
    end
  end

  def get_song()
    puts "What's your favourite song?"
    @your_fav_song = gets.chomp.capitalize!
    puts "#{@your_fav_song} is an absolute classic. You have good taste!"
    puts
    puts "------------------------------------------------------------"
    puts ">>>>>>"
    gets.chomp
  end

  def charge_new_guest(bar, guest)
    puts "A new guest arrived. Their name is #{guest.name}."
    puts "They had £#{guest.cash}. After buying their entry ticket they've got £#{bar.charge_guest(guest)} left."
    puts
    puts "------------------------------------------------------------"
    puts ">>>>>>"
    gets.chomp
  end

  def tell_capacity(room)
    puts "In Room Number #{room.room_number} it looks like #{room.check_guest_names} is already singing."
    puts "Room Number #{room.room_number} has capacity for #{room.check_capacity} more people, so you can join him!"
    puts
    puts "------------------------------------------------------------"
    puts "Press any key to enter the room."
    gets.chomp
    puts "Welcome to Room Number #{room.room_number}."
  end

  def guest_buys_drink(guest, drink)
    puts "#{guest.name} buys a #{drink.name}."
    puts "#{guest.name} had £#{guest.cash} and now they have £#{guest.buy_drink(drink)} left."
    puts
    puts "------------------------------------------------------------"
    puts ">>>>>>"
    gets.chomp
  end

  def offer_drink(guest, drink, cash)
    puts "A #{drink.name} costs £#{drink.price}. Would you like one? Y/N?"
    answer = gets.chomp
    if answer == "Y"
      puts "Here you go. Enjoy!"
      puts "You now have £#{@your_cash -= drink.price} left."
    elsif answer == "N"
      puts "No worries."
    end
    puts "------------------------------------------------------------"
    puts ">>>>>>"
    gets.chomp
  end

  def add_more(room, guests)
    puts "I've just added a couple more people to your room."
    puts "Press any key to check who's on the guestlist."
    gets.chomp
    puts "You're now a party of #{room.check_occupancy}."
    puts "Here are your names: #{room.check_guest_names}."
    puts "------------------------------------------------------------"
    puts "Press any key to check if your favourite song is on the playlist."
    gets.chomp
    if room.has_song?(@your_fav_song)
      puts "Can you believe it? Your song is on the playlist! Sing along!"
    else
      puts "Unfortunately #{@your_fav_song} isn't on the playlist for this room."
      puts "------------------------------------------------------------"
      puts "Nevermind. Why not add it now? Or you can add a different song if you prefer..."
      puts "Just type the title here:"
      @new_song = gets.chomp.capitalize
      puts "Great."
      puts "------------------------------------------------------------"
    end
  end

  def get_new_song()
    puts "What other song would you like to add to the playlist?"
    @new_song2 = gets.chomp.capitalize
    puts "#{@new_song2}? Good choice."
  end

  def tell_playlist(room)
    puts "Press ENTER to check the playlist."
    gets.chomp
    puts "The playlist for Room Number #{room.room_number} is now updated: #{room.playlist.join(", ")}."
    puts "Have fun singing. \u{1F3B6}"
    puts "------------------------------------------------------------"
    puts ">>>>>>"
    gets.chomp
  end

  def favourites(room, guest)
    puts "Let's check if #{guest.name}'s favourite song is on the playlist..."
    puts
    puts "Press ENTER to check."
    gets.chomp
    if room.has_song?(guest.check_fav_song) == true
      puts "Woooop, yes it is! #{guest.name} likes #{guest.check_fav_song}."
    else
      puts "Awwww, nevermind."
    end
    puts ">>>>>>"
    gets.chomp
  end

  def goodbye(guest, room)
    puts
    puts "#{guest.name} is tired of singing and says goodbye."
    puts
    puts ">>>>>>"
    gets.chomp
  end

  def who_is_left(room)
    puts "Press ENTER to check who's left."
    gets.chomp
    puts "In Room Number #{room.room_number} there's now only #{room.check_occupancy} people left: #{room.check_guest_names}."
    puts ">>>>>>"
    gets.chomp
  end

  def final_farewell(bar, name)
    puts
    puts "Looks like it's time to go home. Goodnight #{@name}."
    puts
    puts
    puts "\u{1F3A4} Hope to see you at the #{bar.name} Karaoke Bar again soon! \u{1F3A4}"
    puts
    puts "=========================================================="
  end
end
