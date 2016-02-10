class Game
  def initialize(p_one, p_two)
    @p_one = p_one
    @p_two = p_two
    @turn = 0
  end

  def play
    welcome
    place_ships
    until @p_one.grid.sunk? || @p_two.grid.sunk?
      display_status
      take_turn
    end

    puts (@p_one.grid.sunk? ? "Congratulations, #{@p_two.name}!" : "Congratulations, #{@p_one.name}!")
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
    @p_one.display_shots
    puts "\nYOUR BOARD:"
    @p_one.grid.display
  end

  def take_turn
    if @turn%2 == 0
      shot = @p_one.call_shot
      if @p_two.grid.fire_at(shot[0], shot[1])
        puts "Hit!"
        @p_one.hits << shot
      else
        puts "Miss!"
      end
    else
      shot = @p_two.call_shot
      if @p_one.grid.fire_at(shot[0], shot[1])
        puts "Hit!"
        @p_two.hits << shot
      else
        puts "Miss!"
      end
    end
    @turn += 1
  end
end
