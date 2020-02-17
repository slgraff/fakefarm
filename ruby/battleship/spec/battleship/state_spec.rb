require 'battleship/state'

RSpec.describe Battleship::State do
  let(:submarine) do
    {
      type: :submarine,
      position: 'E7',
      direction: :north,
      length: 3
    }
  end

  let(:board) { Battleship::Board.new([submarine]) }
  let (:ship) { subject.get_ship('s') }
  subject { Battleship::State.new(board, ships: [submarine]) }

  before do
    board.place_ships
    subject.log_ships
  end

  it 'add one ship at a time with #add_shis' do
    result = subject.add_ship(submarine)
    expect(result).to be_instance_of(Battleship::Ship)
  end

  it 'add all ships with #log_ships' do
    subject.log_ships
    result = subject.ship_log.keys.length
    expect(result).to be(subject.ships.length)
  end

    it 'returns a :hit when coordinate matches ship' do
      expect(subject.commit('E7')).to eq(:hit)
    end

    it 'returns :miss when no ship exists' do
      expect(subject.commit('C7')).to eq(:miss)
    end

    it 'update hits and clear' do
      position = 'E7'
      subject.update_ship(ship, position)
      expect(ship.hits).to eq(['E7'])
      expect(ship.clear).to eq(['E6', 'E5'])
    end

    it 'ship sunk?' do
      subject.update_ship(ship, 'E5')
      subject.update_ship(ship, 'E6')
      subject.update_ship(ship, 'E7')
      expect(ship.sunk?).to be(:sunk)
    end
end