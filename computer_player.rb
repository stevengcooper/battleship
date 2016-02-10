require './player.rb'

class ComputerPlayer < Player
  attr_reader :name
  def initialize
    @name = "HAL 9000"
    super()
  end

  def place_ships(ship_lengths)
    ship_lengths.each do |x|
      loop do
        ship = Ship.new(x)
        column = rand(9) + 1
        row = rand(9) + 1
        across = ((rand(2) == 1) ? true : false)
        if @grid.place_ship(ship, column, row, across)
          @ships << ship
          break
        end
      end
    end
    puts "#{@name} has placed its ships.\n"
  end

  def call_shot
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    column = rand(9) + 1
    row = rand(9) + 1
    letters[row] + column.to_s
  end

end
