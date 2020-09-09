module Battleship
  class Game
    attr_reader :board, :ships, :state

    def initialize(ships=[], board: Board, state: State)
      @board = board.new
      @ships = ships
      @state = state.new(@board, ships: @ships)
      place_ships_on_board
      record_ships_with_store
    end

    def fire!(position)
      state.commit(position)
    end

    def place_ships_on_board
      ships.each { |ship| board.add(ship) }
      board.place_ships
    end

    def record_ships_with_store
      state.log_ships
    end
  end
end