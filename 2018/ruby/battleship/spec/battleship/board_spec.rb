require 'battleship/board'

RSpec.describe Battleship::Board do
  let(:submarine) do
    {
      id: :s,
      type: :submarine,
      position: 'E7',
      direction: :north,
      length: 3
    }
  end

  describe 'Board' do
    describe 'initialization' do
      it "is created on initialization" do
        result = subject.grid
        expect = Array.new(10) { Array.new(10) }
        expect(result).to eq(expect)
      end

      it 'map column letter to position' do
        result = subject.columns.first
        expect = ["A", 0]
        expect(result).to eq(expect)
      end
    end

    describe 'getters and setters' do
      it 'get grid position' do
        subject.grid[0][0] = 'boom'
        result = subject.get_position('A1')
        expect = 'boom'
        expect(result).to eq(expect)
      end

      it 'set grid with content' do
        subject.set_position('A1', 'pow')
        result = subject.get_position('A1')
        expect = 'pow'
        expect(result).to eq(expect)
      end
    end

    describe 'direction' do
      before do
        subject.add(submarine)
      end

      let(:subm) { subject.ships.first }

      it 'north goes up' do
        result = subject.point(submarine)
        expect = ["E7","E6","E5"]
        expect(result).to eq(expect)
      end

      it 'south goes down' do
        subm[:direction] = :south
        result = subject.point(subm)
        expect = ["E7","E8","E9"]
        expect(result).to eq(expect)
      end

      it 'east goes right' do
        subm[:direction] = :east
        result = subject.point(subm)
        expect = ["E7","F7","G7"]
        expect(result).to eq(expect)
      end

      it 'west goes left' do
        subm[:direction] = :west
        result = subject.point(subm)
        expect = ["E7","D7","C7"]
        expect(result).to eq(expect)
      end
    end

    describe 'ship awareness' do
      it 'have ships' do
        result = subject.ships
        expect(result).to eq([])
      end

      it 'get ship coordinates' do
        subject.add(submarine)
        result = subject.coordinates(submarine)
        expect = ["E7","E6","E5"]
        expect(result).to eq(expect)
      end

      it 'place ship on board' do
        subject.add(submarine)
        result = subject.place(submarine)
        expect = ["E7","E6","E5"]
        expect(result).to eq(expect)
      end
    end
  end
end