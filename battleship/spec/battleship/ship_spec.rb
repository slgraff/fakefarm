require 'battleship/ship'

RSpec.describe Battleship::Ship do
  let(:submarine) do
    {
      id: :s,
      type: :submarine,
      position: 'E7',
      direction: :north,
      length: 3
    }
  end

  subject { Battleship::Ship.new(config: submarine, coordinates: ['E7', 'E6', 'E5']) }

  describe 'Ship' do
    context 'setup ship' do
      it 'can be initialized' do
        expect(subject).to be_instance_of(Battleship::Ship)
      end

      it 'has type' do
        expect(subject.type).to eq(:submarine)
      end

      it 'has sunk?' do
        subject.hits = ["E7", "E6", "E5"]
        expect(subject.sunk?).to eq(:sunk)
      end

      it 'report damage' do
          subject.hits = ["E6", "E5"]
          expect(subject.report_damage("E7")).to eq(:sunk)
      end

      it 'ship status' do
        expect(subject.status('E7')).to eq(:hit)
        expect(subject.status('E7')).to eq(:already_hit)
        expect(subject.status('E6')).to eq(:hit)
        expect(subject.status('E5')).to eq(:sunk)
      end
    end
  end
end