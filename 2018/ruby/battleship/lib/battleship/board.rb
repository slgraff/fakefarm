module Battleship
  class Board
    attr_reader :grid, :columns, :ships

    def initialize(ships=[])
      @grid = create_grid
      @columns = make_columns
      @ships = ships
    end

    def coordinates(ship)
      point(ship)
    end

    def create_grid
      Array.new(10) do
        Array.new(10)
      end
    end

    def make_columns
      ('A'..'J').map.with_index do |let, i|
        [let, i]
      end
    end

    def get_position(pos)
      row = get_row pos[1]
      col = get_column pos[0]
      row[col]
    end

    def set_position(pos, item)
      row = get_row pos[1]
      col = get_column pos[0]
      row[col] = item
    end

    def get_row(row)
      r = row.to_i - 1
      grid[r]
    end

    def get_column(col)
      @columns.find { |c| c[0] === col }[1]
    end

    def add(ship)
      ships << ship
    end

    def point(ship)
      case ship[:direction]
      when :north
        point_north(ship)
      when :south
        point_south(ship)
      when :east
        point_east(ship)
      when :west
        point_west(ship)
      end
    end

    def point_south(ship)
      col, row = vertical_placement(ship)
      stern = row + (ship[:length]) - 1
      row.upto(stern).map  { |length| "#{col}#{length}" }
    end

    def point_north(ship)
      col, row = vertical_placement(ship)
      stern = row - (ship[:length]) + 1
      row.downto(stern).map  { |length| "#{col}#{length}" }
    end

    def point_west(ship)
      col, row = horizontal_placement(ship)
      stern = col - (ship[:length]) + 1
      col.downto(stern).map  { |length| "#{length.chr}#{row}" }
    end

    def point_east(ship)
      col, row = horizontal_placement(ship)
      stern = col + (ship[:length]) - 1
      col.upto(stern).map  { |length| "#{length.chr}#{row}" }
    end

    def horizontal_placement(ship)
      [ship[:position][0].ord, ship[:position][1].to_i]
    end

    def vertical_placement(ship)
      [ship[:position][0], ship[:position][1].to_i]
    end

    def place(ship)
      coordinates(ship).each do |pin|
        set_position(pin, ship[:type][0])
      end
    end

    def place_ships
      @ships.map { |ship| place(ship) }
    end
  end
end