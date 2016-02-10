require './position.rb'

class Ship
  attr_reader :length, :row, :column, :positions
  def initialize(length)
    @length = length
    @positions = []
  end

  def place(column,row,across)
    return false if @positions != []

    @length.times do |i|
      across ? (@row = row) : (@row = row + i)
      across ? (@column = column + i) : (@column = column)
      @positions << Position.new(@column, @row)
    end
  end

  def covers?(column, row)
    @positions.any? do |i|
      ((i.column == column) && (i.row == row)) ? (return i) : next
    end
  end

  def overlaps_with?(other_ship)
    @positions.any? {|i| other_ship.covers?(i.column, i.row)}
  end

  def fire_at(column, row)
    position = covers?(column,row)
    position && position.gets_hit
  end

  def sunk?
    return false if @positions == []
    @positions.all? {|i| i.hit}
  end

end
