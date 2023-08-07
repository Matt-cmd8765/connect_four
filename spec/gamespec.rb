require_relative '../lib/board'


describe Board do
  subject(:board) { described_class.new }
  context 'The Birth of the Board' do
    it 'creates the correct size array' do
      array_board = board.instance_variable_get(:@board)
      expect(array_board.length).to eq(6)
      board.makeboard
    end
    it 'Subarray correct length' do
      array_board = board.instance_variable_get(:@board)
      expect(array_board[0]).to eq(['o','o','o','o','o','o','o'])
    end
  end
  context 'Board updates properly' do
    before do
      board.move('1', 0)
      board.move('1', 0)
    end
    it 'updates board with correct move' do
      array_board = board.instance_variable_get(:@board)
      expect(array_board[0][0]).to eq('1')
    end
    it 'allows piece to be placed on another piece' do
      array_board = board.instance_variable_get(:@board)
      expect(array_board[1][0]).to eq('1')
    end
  end
#describe end
end