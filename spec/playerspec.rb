require_relative '../lib/player'


describe Player do 
  subject(:player) { described_class.new('Matt') }
  context 'Assign symbol test' do
    before do
      symbol = 'r'
      right_symbol = 's'
      allow(player).to receive(:gets).and_return(symbol, right_symbol)
    end
    it 'Gives error message when incorrect' do
      error_message = 'Please select soccer ball (S) or baseball (B)'
      expect(player).to receive(:puts).with(error_message).once
      player.get_symbol
    end
  end
  context 'Assigns player_2 symbol' do
    it 'player_2 symbol correct' do
      expect(player.assign_player2_symbol("\u26BD")).to eq("\u26BE")
    end
  end

#describe end
end