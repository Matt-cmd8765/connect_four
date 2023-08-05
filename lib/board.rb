class Board

  attr_accessor :board 

  def initialize
    @board = self.makeboard
  end

  def makeboard
    arr = Array.new(42) { Array.new(2) }
    populate_board(arr)
  end

  def showboard
    i = 0
    6.times do
      puts "#{@board[i]} #{@board[i+1]} #{@board[i+2]} #{@board[i+3]} #{@board[i+4]} #{@board[i+5]} #{@board[i+6]}"
      i += 7
    end
  end

  private

  def populate_board(arr)
    i = 0
    j = 0
    arr.each do |sub_array|
      sub_array[0] = i
      sub_array[1] = j
      j += 1
      if j == 7
        j = 0
        i += 1
      end
    end
    arr
  end
end

board = Board.new
p board.showboard
