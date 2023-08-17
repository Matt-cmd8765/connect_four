require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  subject(:game) { described_class.new }
  context 'can determine winner' do
    before do
      array_board = game.instance_variable_get(:@board)
      array_board.move("\u26BD", 2)
      array_board.move("\u26BD", 2)
      array_board.move("\u26BD", 2)
      array_board.move("\u26BD", 2)
    end
    it 'Returns vertical winner' do
      expect(game.winner?(2)).to eq(true)
    end
  end
  context 'can determine winner' do
    before do
      array_board = game.instance_variable_get(:@board)
      array_board.move("\u26BD", 0)
      array_board.move("\u26BD", 1)
      array_board.move("\u26BD", 1)
      array_board.move("\u26BE", 2)
      array_board.move("\u26BD", 2)
      array_board.move("\u26BD", 2)
      array_board.move("\u26BD", 3)
      array_board.move("\u26BE", 3)
      array_board.move("\u26BD", 3)
      array_board.move("\u26BD", 3)
    end
    it 'Returns diagnol winner' do
      expect(game.winner?(3)).to eq(true)
    end
  end
  context 'can determine tie' do
    before do
      array_board = game.instance_variable_get(:@board)
      6.times do
        array_board.move("\u26BD", 0)
        array_board.move("\u26BE", 1)
        array_board.move("\u26BD", 2)
        array_board.move("\u26BE", 3)
        array_board.move("\u26BD", 4)
        array_board.move("\u26BE", 5)
        array_board.move("\u26BD", 6)
      end
    end
    it 'Determines tie correctly' do
      expect(game.tie?).to eq(true)
    end
  end
  context 'Calls false when no tie' do
    before do
      array_board = game.instance_variable_get(:@board)
      array_board.move("\u26BD", 0)
      array_board.move("\u26BE", 1)
    end
    it 'Calls false when no tie' do
      expect(game.tie?).to eq(false)
    end
  end
  context 'shows error message with incorrect moves' do
    let(:player) { instance_double(Player, symbol: "\u26BD") }
    before do 
      incorrect_move = '8'
      correct_move = '4'
      allow(game).to receive(:gets).and_return(incorrect_move, correct_move)
    end
    it 'Gives error message when incorrect' do
      error_message = 'Please pick a number between 0 and 6'
      expect(game).to receive(:puts).with(error_message).once
      game.move(player)
    end
  end
#describe end
end