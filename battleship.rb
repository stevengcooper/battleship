require './computer_player.rb'
require './human_player.rb'
require './player.rb'
require './ship.rb'
require './grid.rb'
require './game.rb'

person = HumanPlayer.new("Mason")
computer = ComputerPlayer.new

game = Game.new
game.play
