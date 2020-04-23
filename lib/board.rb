
# Cree un plateau de 9 cases pour une partie de Morpion
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3) { ' ' } }
  end

  def change_cell(symbol, row, col)
    @board[row][col] = symbol if @board[row][col] == ' '
  end

  def check_rows
    @board.each { |row| return row.first if all_equal?(row) }

    false
  end

  def check_columns
    @board.transpose.each { |row| return row.first if all_equal?(row) }

    false
  end

  def all_equal?(row)
    return if row.first == ' '
    row.each_cons(2).all? { |x,y| x == y }
  end

  def check_diagonals
    diagonals = [
      [@board[0][0], @board[1][1], @board[2][2]],
      [@board[0][2], @board[1][1], @board[2][0]]
    ]

    diagonals.each { |row| return row.first if all_equal?(row) }

    false
  end

  def to_s
    s = ''
    @board.each do |row|
      s << '|'
      row.each { |col| s << "#{col}|" }
      s << "\n"
    end
    s
  end
end
