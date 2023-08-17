class Board

  attr_accessor :board

  def initialize
    @board = self.makeboard
  end

  def makeboard
    arr = Array.new(6) { Array.new(7) { "\u26AA" }}
    arr
  end

  def showboard
    i = 0
    6.times do
      puts "#{5-i} | #{@board[5-i][0]} #{@board[5-i][1]} #{@board[5-i][2]} #{@board[5-i][3]} #{@board[5-i][4]} #{@board[5-i][5]} #{@board[5-i][6]}"
      i += 1
    end
    puts '    --------------------'
    puts '     0  1  2  3  4  5  6'
  end

  def move(piece, column)
    i = 0
    until @board[i][column] == "\u26AA"
      i += 1
    end
    @board[i][column] = piece
  end

  def vertical_winner?(column)
    soccer_array = []
    baseball_array = []
    i = 0
    until @board[i][column] == "\u26AA"
      if @board[i][column] == "\u26BD"
        baseball_array = []
        soccer_array << 'x'
        i += 1
      elsif @board[i][column] == "\u26BE"
        soccer_array = []
        baseball_array << 'x'
        i += 1
      end
    end
    if soccer_array.length == 4 || baseball_array.length == 4
      true
    end
  end

  def horizontal_winner?
    soccer_array = []
    baseball_array = []
    @board.each do |row|
      row.each do |column| 
        if column == "\u26BD"
          baseball_array = []
          soccer_array << 'x'
        elsif column == "\u26BE"
          soccer_array = []
          baseball_array << 'x'
        elsif soccer_array.length == 4 || baseball_array.length == 4
          return true
        end
      end
    end
    nil
  end

  def diagnol1_winner?(move)
    soccer_array = []
    baseball_array = []
    i = 0
    column = move - 3
    return nil if column.negative?

    until @board[i][column] == "\u26AA"
      if @board[i][column] == "\u26BD"
        baseball_array = []
        soccer_array << 'x'
        i += 1
        column += 1
      elsif @board[i][column] == "\u26BE"
        soccer_array = []
        baseball_array << 'x'
        i += 1
        column += 1
      end
    end
    if soccer_array.length == 4 || baseball_array.length == 4
      true
    end
  end

  def diagnol2_winner?(move)
    soccer_array = []
    baseball_array = []
    i = 0
    column = move + 3
    return nil if column > 6

    until @board[i][column] == "\u26AA"
      if @board[i][column] == "\u26BD"
        baseball_array = []
        soccer_array << 'x'
        i += 1
        column -= 1
      elsif @board[i][column] == "\u26BE"
        soccer_array = []
        baseball_array << 'x'
        i += 1
        column -= 1
      end
    end
    if soccer_array.length == 4 || baseball_array.length == 4
      true
    end
  end

#class end
end