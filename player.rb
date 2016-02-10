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

  def place_ships(ship_lengths)
    ship_lengths.each do |x|
      loop do
        puts "#{@name}, where would you like to place a ship of length #{x}?"
        position = get_user_input
        puts "Across or Down?"
        across = (get_user_input.downcase == "across" ? true : false)
        ship = Ship.new(x)
        if @grid.place_ship(ship, @grid.x_of(position), @grid.y_of(position), across)
          @ships << ship
          break
        else
          puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
        end
      end
    end
  end
end
