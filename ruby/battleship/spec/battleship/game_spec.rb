require 'battleship/game'

RSpec.describe Battleship::Game do
  let(:carrier) do
    {
      type: :carrier,
      position: 'A6',
      direction: :south,
      length: 5
    }
  end

  let(:battleship) do
    {
      type: :battleship,
      position: 'D9',
      direction: :east,
      length: 4
    }
  end

  let(:submarine) do
    {
      type: :submarine,
      position: 'I7',
      direction: :north,
      length: 3
    }
  end

  subject(:game) { Battleship::Game.new([carrier, battleship, submarine]) }

  context 'hits' do
    it 'strikes the beginning edge' do
      turn = subject.fire!('I7') # Hits the Submarine
      expect(turn).to eql :hit
    end

    it 'strikes the middle' do
      turn = subject.fire!('E9') # Hits the Battleship
      expect(turn).to eql :hit
    end

    it 'strikes the ending edge' do
      turn = subject.fire!('A10') # Hits the Carrier
      expect(turn).to eql :hit
    end
  end

  context 'misses' do
    it 'does not strike the middle of the ocean' do
      turn = subject.fire!('E6')
      expect(turn).to eql :miss
    end
  end

  context 'sinking' do
    it 'sinks a ship' do

      expect(subject.fire!('A6')).to eql :hit
      expect(subject.fire!('A7')).to eql :hit
      expect(subject.fire!('A8')).to eql :hit
      expect(subject.fire!('A9')).to eql :hit
      expect(subject.fire!('A9')).to eql :already_hit

      turn = subject.fire!('A10')
      expect(turn).to eql :sunk
      expect(subject.fire!('G9')).to eql :hit
    end
  end
end
