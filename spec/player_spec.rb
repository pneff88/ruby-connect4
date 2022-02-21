require_relative '../lib/player'

describe Player do
    subject(:default_player) { Player.new('X') }
    describe "#initialize" do
        context 'when intialized' do
            it 'returns the mark' do
                expect(default_player.mark).to eq('X')
            end
        end
    end

    describe "#get_position" do
        context 'when getting position' do
            it 'returns the position' do
                expect(default_player.get_position).to eq(3)
            end
        end
        
    end
end