class Player

  attr_accessor :name, :symbol

  def initialize(name)
    @name = name
  end

  def get_symbol
    loop do
      selection = gets.chomp
      uppercase_selection = selection.upcase
      if uppercase_selection == 'S'
        @symbol = "\u26BD"
        return @symbol
      elsif uppercase_selection == 'B'
        @symbol = "\u26BE"
        return @symbol
      else
        # put this message in the game object later
        puts 'Please select soccer ball (S) or baseball (B)'
      end 
    end
  end

  def assign_player2_symbol(player1_symbol)
    @symbol = nil
    if player1_symbol == "\u26BD"
      @symbol = "\u26BE"
    elsif player1_symbol == "\u26BE"
      @symbol = "\u26BD"
    end
    @symbol
  end
  
end
