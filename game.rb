class Game
  def initialize(p_one, p_two )
    @p_one = p_one
    @p_two = p_two
  end

  def welcome
    puts "Welcome, #{@p_one.name} and #{@p_two.name}!\nIt's time to play Battleship."
  end

  def place_ships
    @p_one.place_ships([2,3,3,4,5])
    @p_two.place_ships([2,3,3,4,5])
  end

  def display_status
    puts "SHOTS TAKEN:"
    @p_one.grid.display_shots(@p_one.shots)
    puts "\nYOUR BOARD:"
    @p_two.grid.display
  end
end
