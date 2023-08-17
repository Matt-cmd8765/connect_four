require_relative '../lib/player'
require_relative '../lib/board'

class Game

  attr_accessor :player1, :player2, :board

  def initialize
    @board = Board.new
  end

  def info
    self.get_names
    puts "#{player1.name} please select soccer ball (S) or baseball (B)"
    player1_symbol = player1.get_symbol
    player2.assign_player2_symbol(player1_symbol)
  end

  def get_names
    puts 'Player 1 name:'
    player1_name = gets.chomp
    puts 'Player 2 name:'
    player2_name = gets.chomp
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
  end

  def play
    self.info
    loop do
      puts "#{@player1.name} your turn! pick a column"
      @board.showboard
      if winner?(move(@player1))
        puts "#{player1.name} wins!"
        @board.showboard
        break
      end
      puts "#{@player2.name} your turn! pick a column"
      @board.showboard
      if winner?(move(@player2))
        puts "#{player2.name} wins!"
        @board.showboard
        break
      end
      if self.tie?
        puts "It's a tie!"
      end
    end
  end

  def move(player)
    player_move = gets.chomp
    da_move = player_move.to_i
    until da_move >= 0 && da_move < 7 
      puts 'Please pick a number between 0 and 6'
      player_move = gets.chomp
      da_move = player_move.to_i
    end
    board.move(player.symbol, da_move)
    da_move
  end

  def winner?(move)
    if board.vertical_winner?(move) == true
      true
    elsif board.horizontal_winner? == true
      true
    elsif board.diagnol1_winner?(move) == true
      true
    elsif board.diagnol2_winner?(move) == true
      true
    else
      false
    end
  end

  def tie?
    tiearray = []
    @board.board.each do |row|
      row.each do |column|
        tiearray << column
      end
    end
    tiearray.none?("\u26AA")
  end
end