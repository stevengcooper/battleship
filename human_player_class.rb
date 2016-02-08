require './player_class.rb'
class HumanPlayer < Player
  attr_reader :name
  def initialize(name = "Dave")
    @name = name
  end
end
