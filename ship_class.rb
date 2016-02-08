require './position_class.rb'

class Ship
  attr_reader :length, :row, :column, :across, :hits
  def initialize(length)
    @hits = {}
    @length = length
  end

  def place(column,row,across)
    if @positions == nil
      @row = row
      @column = column
      @across = across
      @positions = []

      if @across
        @length.times do |i|
          row = @row
          column = @column + i
          @positions << Position.new(column, row)
        end
      else
        @length.times do |i|
          row = @row + i
          column = @column
          @positions << Position.new(column, row)
        end
      end
      return true
    end
    false
  end

  def covers?(column, row)
    @positions.each do |i|
      ((i.column == column) && (i.row == row)) ? (return i) : next
    end
    false
  end

  def overlaps_with?(other_ship)
    @positions.each do |i|
      other_ship.covers?(i.column, i.row) ? (return true) : next
    end
    false
  end

  def fire_at(column, row)
    position = self.covers?(column, row)
    if position && !position.hit
      position.gets_hit
      true
    else
      return false
    end
  end

  def sunk?
    return false if @positions == nil
    @positions.each do |i|
      i.hit ? next : (return false)
    end
    true
  end

end
