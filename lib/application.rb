# Fait tourner le jeu

class Application
  attr_accessor :game

  def initialize

  end

  def game_turn
    game.play_turn
  end

end
