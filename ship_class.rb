class Ship
  attr_reader :length, :row, :column, :across
  def initialize(length)
    @length = length
  end

  def place(column,row,across)
    @row = row
    @column = column
    @across = across
    true
  end

  def covers?(column, row)
    if @across
      ((@column <= column && column < (@column + @length)) && (@row == row)) ? true : false
    else
      ((@row <= row && row < (@row + @length)) && (@column == column)) ? true : false
    end
  end
end
