class Ship
  attr_reader :length, :row, :column, :across, :hits
  def initialize(length)
    @hits = {}
    @length = length
  end

  def place(column,row,across)
    if @column && @row
      false
    else
      @row = row
      @column = column
      @across = across
      true
    end
  end

  def covers?(column, row)
    if @across
      ((@column <= column && column < (@column + @length)) && (@row == row)) ? true : false
    else
      ((@row <= row && row < (@row + @length)) && (@column == column)) ? true : false
    end
  end

  def overlaps_with?(other_ship)
    if @across
      @length.times do |i|
        row = @row
        column = @column + i
        other_ship.covers?(column, row) ? (return true) : false
      end
    else
      @length.times do |i|
        row = @row + i
        column = @column
        other_ship.covers?(column, row) ? (return true) : false
      end
    end
    false
  end

  def fire_at(column, row)
    if self.covers?(column,row) && @hits[column] != row
      @hits[column] = row
    else
      false
    end
  end

  def sunk?
    if @across
      @length.times do |i|
        row = @row
        column = @column + i
        @hits[column] == row ? true : (return false)
      end
    else
      @length.times do |i|
        row = @row + i
        column = @column
        @hits[column] == row ? true : (return false)
      end
    end
    true
  end
end
