
class Board

  attr_accessor :board

  def initialize
    @board = self.makeboard
  end

  def makeboard
    arr = Array.new(6) { Array.new(7) { 'o' }}
    arr
  end

  def showboard
    i = 0
    6.times do
      puts "#{5-i} | #{@board[5-i][0]} #{@board[5-i][1]} #{@board[5-i][2]} #{@board[5-i][3]} #{@board[5-i][4]} #{@board[5-i][5]} #{@board[5-i][6]}"
      i += 1
    end
    puts '    --------------'
    puts '    0 1 2 3 4 5 6'
  end

  def move(piece, column)
    i = 0
    until @board[i][column] == "o"
      i += 1
    end
    @board[i][column] = piece
  end

#class end
end

board = Board.new
board.move('1', 0)
board.move('1', 0)

board.showboard