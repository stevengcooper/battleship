require './player.rb'
require "byebug"

class HumanPlayer < Player
  attr_reader :name
  def initialize(name = "Dave")
    @name = name
    @shots = []
    @hits = []
    super()
  end

  def shots
    @shots
  end

  def hits
    @hits
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

  def call_shot
    puts "#{@name}, please enter the coordinates for your next shot (e.g. 'B10'):"
    coordinate = get_user_input
    array = [@grid.x_of(coordinate), @grid.y_of(coordinate)]
    @shots << array
    array
  end

  def display_shots
    display_header
    display_line
    ("A".."J").each_with_index do |l, i|
      y = i+1
      line = l + " |"
      (1..10).each do |x|
        line << if @hits.include?([x,y])
                  " + |"
                elsif @shots.include?([x,y])
                  " - |"
                else
                  "   |"
                end
      end
      puts line
    end
    display_line
  end

  private def display_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end

  private def display_line
    puts "  -----------------------------------------"
  end

end
