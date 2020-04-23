# Cree un jeu de morpion
class Game
  attr_accessor :board, :player, :num_turn

  def initialize
    @player = Array.new
    @board = Board.new
    @num_turn = 1
  end

  def launch_game
    puts "Player 1 comment t'appelles-tu ?"
    print '>'
    name1 = gets.chomp

    puts "Player 2 comment t'appelles-tu ?"
    print '>'
    name2 = gets.chomp

    distribution = rand(1..2)
    if distribution == 1
      @player << Player.new(name1, "X")
      @player << Player.new(name2, "O")
      puts "#{name1} aura le symbole X et jouera en premier !"
    else 
      @player << Player.new(name2, "X")
      @player << Player.new(name1, "O")
      puts "#{name2} aura le symbole X et jouera en premier !"
    end

    play_turn
  end

  def play_turn
    while !winner? || @num_turn > 10
      puts @board.to_s
      puts "Tour de jeu de #{@player[0].name}\nQuelle ligne voulez-vous jouer ? (1, 2 ou 3)"
      row = gets.chomp.to_i
      puts "Quelle colonne voulez-vous jouer (1, 2 ou 3)"
      col = gets.chomp.to_i
      
      @board.change_cell(@player[0].symbol, row-1, col-1)
      @num_turn += 1
      break if winner?

      #binding.pry
      puts @board.to_s
      puts "Tour de jeu de #{@player[1].name}\nQuelle ligne voulez-vous jouer ? (1, 2 ou 3)"
      row = gets.chomp.to_i
      puts "Quelle colonne voulez-vous jouer (1, 2 ou 3)"
      col = gets.chomp.to_i
      @board.change_cell(@player[1].symbol, row-1, col-1)
      @num_turn += 1
      break if winner?
    end
    
    puts @board.to_s
    if winning_conditions == 'X'
      puts "Bravo #{@player[0].name}"
    elsif winning_conditions == 'O'
      puts "Bravo #{@player[1].name}"
    elsif @num_turn > 9
      puts "Match nul !" 
    end
  end

  def winner?
    winning_conditions == 'X' || winning_conditions == 'O'
  end

  def game_over?
 # || (winning_conditions == 'X' || winning_conditions == 'O')
  end

  def winning_conditions
    @board.check_rows || @board.check_columns || @board.check_diagonals
  end

end
