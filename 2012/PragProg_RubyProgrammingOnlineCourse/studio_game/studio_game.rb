
require './player'
require './game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("dave")
player5 = Player.new("danae")
player6 = Player.new("steve")
player7 = Player.new("desi")


knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(player4)
knuckleheads.add_player(player5)
knuckleheads.add_player(player6)
knuckleheads.add_player(player7)
knuckleheads.play(5)
knuckleheads.print_stats
