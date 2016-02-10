require './grid.rb'
require './ship.rb'

def get_user_input
  gets.chomp
end

class Player
  attr_reader :grid, :ships
  def initialize
    @grid = Grid.new
    @ships = []
  end
end
