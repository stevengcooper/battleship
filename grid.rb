require './ship.rb'

class Grid

  attr_reader :ships

  def initialize
    @ships = []
  end

  def display

    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]

    puts "    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------"

    10.times do |i|
      row = "#{letters[i]} |"
      10.times do |j|
        ship = has_ship_on?(j+1, i+1)
        if ship
          ship.positions.each do |x|
            if x.hit && (x.column == j+1 && x.row == i+1)
              row += " X |"
            elsif (x.column == j+1 && x.row == i+1)
              row += " O |"
            end
          end
        else
          row += "   |"
        end
      end
      puts row
    end
    puts "  -----------------------------------------"
  end

  def x_of(string)
    x = string.split("", 2)
    x = x.join[1..-1].to_i
    return x
  end

  def y_of(string)
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    y = string.split("", 2)
    return (letters.index(y[0]) + 1)
  end


  def fire_at(column, row)
    if has_ship_on?(column, row)
      @ships.each do |i|
        (i.fire_at(column, row)) ? (return true) : false
      end
    end
    false
  end

  def sunk?
    return false if @ships == []
    @ships.each do |i|
      i.sunk? ? next : (return false)
    end
    true
  end

  def place_ship(ship, column, row, across)
    if ship.place(column, row, across)
      ship.positions.each do |i|
        has_ship_on?(i.column, i.row) ? (return false) : true
      end
      @ships << ship
      true
    end
  end

  def has_ship_on?(x, y)
    @ships.each do |i|
      i.covers?(x, y) ? (return i) : next
    end
    false
  end

end
