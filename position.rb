class Position

  attr_reader :column, :row, :hit

  def initialize(column, row)
    @column = column
    @row = row
    @hit = false
  end

  def gets_hit
    if @hit
      false
    else
      @hit = true
    end
  end
end
