
# Classe joueur pour un jeu de morpion
class Player
  attr_accessor :name, :num_victories, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @num_victories = 0
  end
end
