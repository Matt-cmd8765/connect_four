require_relative '../lib/board'


describe Board do
  subject(:board) { described_class.new }
  context 'The Birth of the Board' do
    it 'creates the correct size array' do
      array_board = board.instance_variable_get(:@board)
      expect(array_board.length).to eq(42)
      board.makeboard
    end
    it 'populates array correctly, array start' do
      array_board = board.instance_variable_get(:@board)
      expect(array_board[0]).to eq([0,0])
    end
    it 'populates array correctly, array end' do
      array_board = board.instance_variable_get(:@board)
      expect(array_board[41]).to eq([5,6])
    end
  end
    
end