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
      expect(array_board[0]).to eq(["\u26AA","\u26AA","\u26AA","\u26AA","\u26AA","\u26AA","\u26AA"])
    end
  end
  context 'Board updates properly after move' do
    before do
      board.move("\u26BD", 0)
      board.move("\u26BD", 0)
    end
    it 'updates board with correct move' do
      array_board = board.instance_variable_get(:@board)
      expect(array_board[0][0]).to eq("\u26BD")
    end
    it 'allows piece to be placed on another piece' do
      array_board = board.instance_variable_get(:@board)
      expect(array_board[1][0]).to eq("\u26BD")
    end
  end
  context 'Determines vertical winner' do
    before do
      board.move("\u26BD", 0)
      board.move("\u26BD", 0)
      board.move("\u26BD", 0)
      board.move("\u26BD", 0)
    end
    it 'calls winner vertically' do
      array_board = board.instance_variable_get(:@board)
      expect(board.vertical_winner?(0)).to be true
    end
  end
  context 'Does not return vertical winner when there is none' do 
    before do
      board.move("\u26BD", 0)
      board.move("\u26BD", 0)
    end
    it 'returns nil' do
      array_board = board.instance_variable_get(:@board)
      expect(board.vertical_winner?(0)).to eq(nil)
    end
  end
  context 'Determines horizontal winner correctly' do
    before do
      board.move("\u26BD", 0)
      board.move("\u26BD", 1)
      board.move("\u26BD", 2)
      board.move("\u26BD", 3)
    end
    it 'Call winner horizontally' do
      array_board = board.instance_variable_get(:@board)
      expect(board.horizontal_winner?(0)).to be true
    end
  end
  context 'Does not call horizontal winner when there is none' do
    before do
      board.move("\u26BD", 0)
      board.move("\u26BD", 1)
    end
    it 'Returns nil' do
      array_board = board.instance_variable_get(:@board)
      expect(board.horizontal_winner?(0)).to eq(nil)
    end
  end
#describe end
end