
require_relative './karaoke_bar'
require_relative './song'
require_relative './room'
require_relative './guest'
require_relative './drink'
require_relative './ui'

@bar = KaraokeBar.new("CCC", 10)
@song = Song.new("Yellow Submarine")
@songs = [@song]
@beer = Drink.new("beer", 4)
@wine = Drink.new("wine", 2)
@guest1 = Guest.new("Sam", "Eye of the Tiger", 20)
@guest2 = Guest.new("Jim", "Final Countdown", 40)
@guest3 = Guest.new("Sally", "Bohemian Rhapsody", 30)
@guests = [@guest1, @guest2, @guest3]
@room1 = Room.new(1, 4)
@ui = UI.new

@ui.welcome(@bar)
@ui.get_name()
@ui.get_budget(@bar)
@ui.get_song()
@you = Guest.new(@ui.name, @ui.your_fav_song, @ui.your_cash)
@ui.charge_new_guest(@bar, @guest1)
@room1.add_guest(@guest1)
@ui.tell_capacity(@room1)
@ui.guest_buys_drink(@guest1, @wine)
@room1.add_guest(@you)
@ui.offer_drink(@ui.name, @beer, @ui.your_cash)
@room1.add_guest(@guest2)
@room1.add_guest(@guest3)
@ui.add_more(@room1, @guests)
@room1.has_song?(@ui.your_fav_song)
@room1.add_song(@ui.new_song)
@ui.get_new_song()
@room1.add_song(@ui.new_song2)
@room1.add_song(@guest1.check_fav_song)
@room1.add_song(@guest2.check_fav_song)
@ui.tell_playlist(@room1)
@ui.favourites(@room1, @guest1)
@ui.offer_drink(@ui.name, @wine, @ui.your_cash)
@ui.goodbye(@guest1, @room1)
@room1.remove_guest(@guest1)
@ui.who_is_left(@room1)
@ui.goodbye(@guest2, @room1)
@room1.remove_guest(@guest2)
@ui.who_is_left(@room1)
@ui.final_farewell(@bar, @ui.name)
